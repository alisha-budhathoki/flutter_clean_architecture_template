import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initializeHive() async {
  var dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
}
