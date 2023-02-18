import 'package:get/get.dart';
import 'package:chap/pages/frame/welcome/state.dart';

class WelcomeController extends GetxController {
  WelcomeController(); // the controller(it's the constructor).
  // it sits between UI & State.
  // the controller gets the state variable and show in the UI.
  // Simillarly UI will talk with the controller and update the state variables.
  final title = " # Chap . "; // this variable will not change over time
  final state = WelcomeState(); // created a variable as we can use it later

  @override
  void onReady() {
    super.onReady(); // we will do transitions using this
    // from here we can go do different places i.e. Routing
    print(" WelcomeController");
  }
}
