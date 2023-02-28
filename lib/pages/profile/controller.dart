import 'package:chap/pages/profile/state.dart';
import 'package:get/get.dart';

import '../../../common/routes/names.dart';

class ProfileController extends GetxController {
  ProfileController(); // the controller(it's the constructor).
  // it sits between UI & State.
  // the controller gets the state variable and show in the UI.
  // Simillarly UI will talk with the controller and update the state variables.
  final title = " # Chap . "; // this variable will not change over time
  final state = ProfileState(); // created a variable as we can use it later

  @override
  void onReady() {
    super.onReady(); // we will do transitions using this
    // from here we can go do different places i.e. Routing
    // everything is getting initialised and then this is getting executed.
    // so now we will and can got to new routes/pages
    // so first we go to the sign in page
    Future.delayed(
        // wait 3 seconds later and call the AppRoutes function
        const Duration(seconds: 3),
        () => Get.offAllNamed(AppRoutes.Message));
  }
}
