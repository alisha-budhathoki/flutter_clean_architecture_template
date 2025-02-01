import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalBlocProviders {
  static BlocProvider getProviders<B extends Bloc<dynamic, dynamic>>(
    B Function() create, {
    List<dynamic> events = const [],
  }) {
    return BlocProvider<B>(
      create: (context) {
        final bloc = create();
        for (var event in events) {
          bloc.add(event);
        }
        return bloc;
      },
    );
  }

  static BlocProvider getCubitProviders<B extends Cubit<dynamic>>(
    B Function() create,
  ) {
    return BlocProvider<B>(
      create: (context) {
        final cubit = create();

        return cubit;
      },
    );
  }
}
