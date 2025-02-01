import 'package:dartz/dartz.dart';
import 'package:flutter_core_project/core/index.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppErrorHandler, Type>> call(Params params);
}

abstract class UseCaseStream<Type, Params> {
  Stream<Either<AppErrorHandler, Type>> call(Params params);
}
