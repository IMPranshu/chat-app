// this is the place we have our UI
import 'package:chap/common/values/values.dart';
import 'package:chap/pages/frame/sign_in/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPage extends GetView<SignInController> {
  // as we have used GetView<> now we can access the variables from WelcomeController here
  const SignInPage({super.key});

  Widget _buildLogo() {
    // widget is something that we see on the screen
    // a container is a widget so we can return a Container here it is totally valid
    return Container(
      margin: EdgeInsets.only(top: 100.h, bottom: 80.h),
      child: Text(
        "# Chap .",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
          fontSize: 34.sp,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Center(
        child: Column(
          children: [_buildLogo()],
        ),
      ),
    );
  }
}
