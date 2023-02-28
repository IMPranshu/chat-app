import 'package:flutter/material.dart';
import 'package:chap/common/routes/routes.dart';
import 'package:chap/common/store/store.dart';

import 'package:get/get.dart';

// check if the user has logged in
// this route class gets called before user access any of the controller
// we are using the middleware service provided by Getx
class RouteAuthMiddleware extends GetMiddleware {
  // priority variable the smaller the better
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin ||
        route == AppRoutes.SIGN_IN ||
        route == AppRoutes.INITIAL ||
        route == AppRoutes.Message) {
      return null;
    } else {
      // if none of the above conditions met then we show the Sign in page
      Future.delayed(const Duration(seconds: 2),
          () => Get.snackbar("Tips", "Login expired, please login again!"));
      return const RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
