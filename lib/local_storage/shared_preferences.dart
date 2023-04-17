import 'dart:convert';

import 'package:pt_berca_kawan_sejati/lib.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsStorage {
  static const int kItemOnCart = 0;

  // static const String kUnreadNotificationCount = "0";
  // static const bool kisFirstRunning = true;
  // DataConfig? appConfig;
  // static const bool kisConnectedSocket = false;

  static Future<SharedPreferences> get sharedPrefs => SharedPreferences.getInstance();

  //UserUUID
  static Future<int?> getItemOnCart() async => (await sharedPrefs).getInt("kItemOnCart");

  static Future setItemOnCart({required String itemOnCart}) async => (await sharedPrefs).setString("kItemOnCart", itemOnCart);

  static Future clearItemOnCart() async => (await sharedPrefs).remove("kItemOnCart");

// static Future clearAll() async {
//   (await sharedPrefs).remove(kItemOnCart);
//   // (await sharedPrefs).remove(kUnreadNotificationCount);
// }
}
