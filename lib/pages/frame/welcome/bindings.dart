import 'package:chap/pages/frame/welcome/controller.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';

class WelcomeBinding implements Bindings {
  //* this is called dependency injection
  // As lot of UI parts will be coming from "view" which will depend on the controller
  // So this needs the controller to be in the memory
  // SO whereeven the WelcomeBinding class is called the WelcomeController class gets called automatically.
  
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}
