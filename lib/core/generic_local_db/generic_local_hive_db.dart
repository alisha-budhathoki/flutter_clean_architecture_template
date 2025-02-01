// import 'package:capitalmarket/core/errors_handler/error_handler.dart';
// import 'package:hive/hive.dart';

// class GenericLocalHiveDB {
//   static Future<void> saveData<T>({
//     required String boxName,
//     required String key,
//     required T data,
//   }) async {
//     try {
//       final dataBox = Hive.box<T>(boxName);
//       await dataBox.put(key, data);
//     } catch (e) {
//       throw AppErrorHandler(message: "Error retrieving data: ${e.toString()}");
//     }
//   }

//   static Future<T> getData<T>({
//     required String boxName,
//     required String key,
//   }) async {
//     try {
//       final dataBox = Hive.box<T>(boxName);
//       final result = dataBox.get(key);
//       if (result == null) {
//         throw AppErrorHandler(message: "Data not found ");
//       }
//       return result;
//     } catch (e) {
//       throw AppErrorHandler(message: "Error retrieving data: ${e.toString()}");
//     }
//   }

//   static Future<List<T>> getDataList<T>({
//     required String boxName,
//   }) async {
//     try {
//       final dataBox = Hive.box<T>(boxName);
//       return dataBox.values.toList();
//     } catch (e) {
//       throw AppErrorHandler(message: "Error retrieving data: ${e.toString()}");
//     }
//   }

//   static Future<void> saveDataList<T>({
//     required String boxName,
//     required List<T> dataList,
//   }) async {
//     try {
//       final dataBox = Hive.box<T>(boxName);
//       await dataBox.clear();
//       await dataBox.addAll(dataList);
//     } catch (e) {
//       throw AppErrorHandler(message: "Error retrieving data: ${e.toString()}");
//     }
//   }
// }
