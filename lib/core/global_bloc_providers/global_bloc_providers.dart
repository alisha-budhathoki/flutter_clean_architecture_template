import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalBlocProviders {
  static List<BlocProvider> getProviders<B extends Bloc<dynamic, dynamic>>(
    B Function() create, {
    List<dynamic> events = const [],
  }) {
    return [
      BlocProvider<B>(
        create: (context) {
          final bloc = create();
          for (var event in events) {
            bloc.add(event);
          }
          return bloc;
        },
      ),
    ];
  }
}