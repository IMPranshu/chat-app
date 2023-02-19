// this is the place we have our UI
import 'package:chap/common/values/values.dart';
import 'package:chap/pages/frame/welcome/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends GetView<WelcomeController> {
  // as we have used GetView<> now we can access the variables from WelcomeController here
  const WelcomePage({super.key});

  Widget _buildPageHeadTitle(String title) {
    return Container(
      margin: EdgeInsets.only(top: 350),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryElementText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.bold,
          fontSize: 45
              .sp, // sp marking makes it adaptive. so it's dynamic i.e. based on screen size it changes and not remains 45
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryElement,
        body: Container(
            // the height and width is being used from a package and it will take care for all the devices sizes
            width: 360
                .w, // w marking makes it adaptive. so it's dynamic i.e. based on screen size it changes and not remains 45
            height: 780
                .h, // h marking make sit adaptive. so it's dynamic i.e. based on screen size it changes and not remains 45
            //* special trick to use the variable from other places is to use the keyword "controller"
            // as controller is the object of WelcomeController[Similar to OOPs concept]
            child: _buildPageHeadTitle(controller
                .title) // the title is coming from the controller, so for that we need to bind this view with the controller
            ));
  }
}
