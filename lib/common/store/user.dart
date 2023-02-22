import 'dart:convert';
import 'package:chap/common/entities/entities.dart';
import 'package:chap/common/routes/names.dart';
import 'package:chap/common/services/services.dart';
import 'package:chap/common/values/values.dart';
import 'package:get/get.dart';

// this class as from it name itself tells it stores user data
// we are using Controller instead of service as the data of this is not needed all the time in the memory
class UserStore extends GetxController {
  // this is one of the config files for our app
  // config files should be loaded in the begining
  // so in main.dart file we have to add this UserStore to get loaded
  static UserStore get to => Get.find();

  // variable for checking if the user us logged in or not
  // it's default value is false
  final _isLogin = false.obs;
  // this variable is used to remember every user as a unique user
  String token = '';
  //
  final _profile = UserItem().obs;

  bool get isLogin => _isLogin.value;
  UserItem get profile => _profile.value;
  bool get hasToken => token.isNotEmpty;

  // in a GetxController onInit method is the first method that gets called in it's lifecycle
  // here we can do initialization and checking
  @override
  void onInit() {
    super.onInit();
    // when we first run the app all the key values should be returned empty
    token = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    var profileOffline = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
    if (profileOffline.isNotEmpty) {
      _isLogin.value = true;
      _profile(UserItem.fromJson(jsonDecode(profileOffline)));
    }
  }

  // saving token
  Future<void> setToken(String value) async {
    await StorageService.to.setString(STORAGE_USER_TOKEN_KEY, value);
    token = value;
  }

  // get profile
  Future<String> getProfile() async {
    if (token.isEmpty) return "";
    // var result = await UserAPI.profile();
    // _profile(result);
    // _isLogin.value = true;
    return StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
  }

  // saving profile
  // here profile data is an object
  Future<void> saveProfile(UserItem profile) async {
    _isLogin.value = true;
    // profile is an object and we want to store it in our StorageService/server we need to convert it to string-like
    // so we are using jsonEncode method for doing just that
    StorageService.to.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(profile));
    _profile(profile);
    setToken(profile.access_token!);
  }

  // this method is called during logout
  Future<void> onLogout() async {
    // if (_isLogin.value) await UserAPI.logout();

    // as we logout from the app we want to remove the user information stored in the memory
    //* because the same app in the same device can be used by different people
    await StorageService.to.remove(STORAGE_USER_TOKEN_KEY);
    await StorageService.to.remove(STORAGE_USER_PROFILE_KEY);
    _isLogin.value = false;
    token = '';
    Get.offAllNamed(AppRoutes.SIGN_IN);
  }
}
