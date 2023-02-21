import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// this class's values have to used form other classes, it can't be used on it's own
// it has to be called form other classes to access it's methods
// in this app we have the class to access these methods of this class "UserStore" in user.dart
class StorageService extends GetxService {
  static StorageService get to => Get.find();
  late final SharedPreferences // when app is installed the data is saved using Shared Preferences
      _prefs; // this is used to store the data in the app's memory

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  // these are different methods to store different types of values
  // there are 2 values here i.e. key(string) & the value(string/bool/List) we want to store
  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  // these are different methods to get the values stored
  // we have to send the key to retrive the stored values
  // if correct key is sent then value will be given else empty value will be returned
  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  List<String> getList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }
}
