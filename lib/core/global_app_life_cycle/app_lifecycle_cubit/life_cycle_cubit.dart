import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum LifeCycleState {
  resumed,
  inactive,
  paused,
  detached,
}

class LifeCycleCubit extends Cubit<LifeCycleState> {
  LifeCycleCubit() : super(LifeCycleState.resumed);

  void updateState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        emit(LifeCycleState.resumed);
        break;
      case AppLifecycleState.inactive:
        emit(LifeCycleState.inactive);
        break;
      case AppLifecycleState.paused:
        emit(LifeCycleState.paused);
        break;
      case AppLifecycleState.detached:
        emit(LifeCycleState.detached);
        break;
      default:
    }
  }
}
