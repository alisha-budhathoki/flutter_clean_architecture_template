import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

class GenericIsolateManager<T> {
  Isolate? _isolate;
  SendPort? _sendPort;
  ReceivePort? _receivePort;
  bool _isInitialized = false;

  // Queue to hold messages
  final _messageQueue = <dynamic>[];

  Function(List<T>)? onDataReceived;

  Future<void> initialize(
    FutureOr<List<T>> Function(dynamic) processingFunction,
  ) async {
    if (_isInitialized) {
      log("GenericIsolateManager is already initialized. Disposing and reinitializing...");
      dispose();
    }

    _receivePort = ReceivePort();

    try {
      _isolate = await Isolate.spawn(
        _isolateEntryPoint,
        [_receivePort!.sendPort, processingFunction],
      );

      _receivePort!.listen((message) {
        if (message is SendPort) {
          _sendPort = message;
          // It sends all queued messages
          _flushMessageQueue();
        } else if (message is List<T>) {
          onDataReceived?.call(message);
        }
      });

      _isInitialized = true;
    } catch (e) {
      log("Error initializing GenericIsolateManager: $e");
      dispose();
      rethrow;
    }
  }

  void sendMessage(dynamic message) {
    if (_sendPort != null) {
      _sendPort!.send(message);
    } else {
      log("SendPort is not initialized yet. Queuing message...");
      _messageQueue.add(message);
    }
  }

  void _flushMessageQueue() {
    if (_sendPort != null) {
      for (final message in _messageQueue) {
        _sendPort!.send(message);
      }
      _messageQueue.clear();
    }
  }

  void dispose() {
    _isolate?.kill(priority: Isolate.immediate);
    _receivePort?.close();
    _isolate = null;
    _sendPort = null;
    _receivePort = null;
    _isInitialized = false;
  }

  static void _isolateEntryPoint<T>(List<dynamic> args) {
    final mainSendPort = args[0] as SendPort;
    final processingFunction = args[1] as FutureOr<List<T>> Function(dynamic);
    final isolateReceivePort = ReceivePort();
    mainSendPort.send(isolateReceivePort.sendPort);
    isolateReceivePort.listen((message) async {
      if (message != null) {
        try {
          final processedData = await processingFunction(message);
          mainSendPort.send(processedData);
        } catch (e) {
          log("Error processing data in isolate: $e");
        }
      }
    });
  }
}
