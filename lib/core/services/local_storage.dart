import 'package:hive/hive.dart';

class AppLocalStorage {
  static var box = Hive.box('user');

  static void cachData({key, value}) {
    box.put(key, value);
  }

  static dynamic gatCachData({key}) {
    return box.get(key);
  }
}
