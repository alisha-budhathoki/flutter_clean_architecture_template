import 'package:flutter/widgets.dart';
import 'package:flutter_core_project/core/global_app_life_cycle/index.dart';

class GlobalLifecycleObserver extends WidgetsBindingObserver {
  final LifeCycleCubit appLifeCycleCubit;
  GlobalLifecycleObserver({required this.appLifeCycleCubit});

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
      appLifeCycleCubit.updateState(state);

  }
}
