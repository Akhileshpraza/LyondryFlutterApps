import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';


class AppPreferences {
  static AppPreferences _appPreferences;
  static SharedPreferences _prefs;
  static Lock _lock = Lock();

  /// call this method from iniState() function of mainApp().
  static Future<AppPreferences> getInstance() async {
    if (_appPreferences == null) {
      await _lock.synchronized(
        () async {
          if (_appPreferences == null) {
            // keep local instance till it is fully initialized.
            var singleton = AppPreferences._();
            await singleton._init();
            _appPreferences = singleton;
          }
        },
      );
    }
    return _appPreferences;
  }

  AppPreferences._();

  Future _init() async {
    _prefs = await SharedPreferences.getInstance();
  }
  ///keys
  static String customerName = 'userName';
  static String customerId = 'customerId';
  static String customerMobileNo = 'customerMobileNo';
  static String customerEmailId = 'customerEmailId';
  static String customerGroupId = "customerGroupId";
  static String entryStatus = 'entryStatus';
  static String token ='Invalid or Expired Token';
  static String addressId ='addressId';
  static String customerAddressId ='customerAddressId';
  static String addressBuildingNoHouseName ='addressBuildingNoHouseName';
  static String addressStreet ='addressStreet';
  static String addressLandmark ='addressLandmark';
  static String addressCity ='addressCity';
  static String addressPin ='addressPin';
  static String addressType ='addressType';
  static String addressTypeName ='addressTypeName';
  static String addressDefault ='addressDefault';
  static String orderStatus = 'orderStatus';


  /// sets methods
  static Future<bool> setBool(String key, bool value) async {
    if (_prefs == null) return null;
    return await _prefs.setBool(key, value);
  }

  static Future<bool> setDouble(String key, double value) async {
    if (_prefs == null) return null;
    return await _prefs.setDouble(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    if (_prefs == null) return null;
    return await _prefs.setInt(key, value);
  }

  static Future<bool> setString(String key, String value) async {
    if (_prefs == null) return null;
    return await _prefs.setString(key, value);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    if (_prefs == null) return null;
    return await _prefs.setStringList(key, value);
  }

  /// gets methods
  static bool getBool(String key) {
    if (_prefs == null) return null;
    return _prefs.getBool(key);
  }

  static double getDouble(String key) {
    if (_prefs == null) return null;
    return _prefs.getDouble(key);
  }

  static int getInt(String key) {
    if (_prefs == null) return null;
    return _prefs.getInt(key);
  }

  static String getString(String key) {
    if (_prefs == null) return null;
    return _prefs.getString(key);
  }

  ///delete methods
  static Future<bool> remove(String key) async {
    if (_prefs == null) return null;
    return await _prefs.remove(key);
  }

  /// clear Pref
  static Future<bool> clear() async {
    if (_prefs == null) return null;
    return await _prefs.clear();
  }

  /// Pref contains key
  static bool containsKey(String key) {
    return _prefs.containsKey(key);
  }
}
