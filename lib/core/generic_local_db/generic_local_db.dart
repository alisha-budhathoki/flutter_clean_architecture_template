import 'package:dartz/dartz.dart';
import 'package:flutter_core_project/core/index.dart';
import 'package:hive/hive.dart';

class GenericLocalDB {
  static Future<Either<AppErrorHandler, void>> saveData<T>({
    required String boxName,
    required String key,
    required T data,
  }) async {
    try {
      final dataBox = Hive.box<T>(boxName);
      await dataBox.put(key, data);
      return right(null);
    } catch (e) {
      return left(AppErrorHandler(message: e.toString()));
    }
  }

  static Future<Either<AppErrorHandler, T>> getData<T>({
    required String boxName,
    required String key,
  }) async {
    try {
      final dataBox = Hive.box<T>(boxName);
      final result = dataBox.get(key);
      if (result == null) {
        return left(AppErrorHandler(message: "Data Not Found!!", isLocalError: true));
      }
      return right(result);
    } catch (e) {
      return left(AppErrorHandler(message: e.toString(), isLocalError: true));
    }
  }

  static Future<Either<AppErrorHandler, List<T>>> getDataList<T>({
    required String boxName,
  }) async {
    try {
      final dataBox = Hive.box<T>(boxName);
      final dataList = dataBox.values.toList();
      // if (dataList.isEmpty) {
      //   return left(AppErrorHandler(message: "Data Not Found!!", isLocalError: true));
      // } else {
      //   return right(dataList);
      // }
      return right(dataList);
    } catch (e) {
      return left(AppErrorHandler(message: e.toString(), isLocalError: true));
    }
  }

  static Future<Either<AppErrorHandler, void>> saveDataList<T>({
    required String boxName,
    required List<T> dataList,
  }) async {
    try {
      final dataBox = Hive.box<T>(boxName);
      await dataBox.clear();
      await dataBox.addAll(dataList);
      return right(null);
    } catch (e) {
      return left(AppErrorHandler(message: e.toString()));
    }
  }
}
