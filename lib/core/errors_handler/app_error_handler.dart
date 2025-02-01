class AppErrorHandler {
  final String message;
  final StackTrace stackTrace = StackTrace.current;
  final bool isLocalError;

  AppErrorHandler({
    required this.message,
    this.isLocalError = false,
  });

  AppErrorHandler copyWith({
    String? message,
    bool? isLocalError,
  }) {
    return AppErrorHandler(
      message: message ?? this.message,
      isLocalError: isLocalError ?? this.isLocalError,
    );
  }

  @override
  String toString() => 'AppErrorHandler(message: $message stackTrace $stackTrace )';

  @override
  bool operator ==(covariant AppErrorHandler other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
