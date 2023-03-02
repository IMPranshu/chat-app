import 'package:chap/common/store/user.dart';
import 'package:chap/pages/profile/state.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common/routes/names.dart';

class ProfileController extends GetxController {
  ProfileController(); // the controller(it's the constructor).
  // it sits between UI & State.
  // the controller gets the state variable and show in the UI.
  // Simillarly UI will talk with the controller and update the state variables.
  final title = " # Chap . "; // this variable will not change over time
  final state = ProfileState(); // created a variable as we can use it later

  void goLogout() async {
    await GoogleSignIn()
        .signOut(); // this is good enough to disconnect with the google servers only.

    await UserStore.to
        .onLogout(); // this is needed to remove any user related data from our app and also go automatically to the login page
  }
}
