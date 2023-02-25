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

  Widget _buildThirdPartyLogin(String loginType, String logo) {
    return GestureDetector(
      child: Container(
          width: 295.w,
          height: 44.h,
          padding: EdgeInsets.all(10.h),
          margin: EdgeInsets.only(bottom: 15.h),
          decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  // all the below three spreadradius, blurradius and offset is giving the button the floating effect that is generally used in modern designs
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ]),
          child: Row(
            mainAxisAlignment:
                logo == '' ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              logo == ''
                  ? Container()
                  : Container(
                      padding: EdgeInsets.only(left: 40.2, right: 30.w),
                      child: Image.asset("assets/icons/$logo.png"),
                    ),
              Container(
                child: Text(
                  "Sign in with $loginType",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp,
                  ),
                ),
              )
            ],
          )),
      onTap: () {
        controller.handleSignIn("google");
      },
    );
  }

  Widget _buildOrWidget() {
    return Container(
        margin: EdgeInsets.only(top: 20.h, bottom: 35.h),
        child: Row(
          children: [
            Expanded(
              // this is used when we want to take whole horizontal space in the UI
              child: Divider(
                indent: 50,
                height: 2.h,
                color: AppColors.primarySecondaryElementText,
              ),
            ),
            const Text("  or  "),
            Expanded(
              child: Divider(
                endIndent: 50,
                height: 2.h,
                color: AppColors.primarySecondaryElementText,
              ),
            ),
          ],
        ));
  }

  Widget _buildSignUpWidget() {
    return GestureDetector(
      child: Column(
        children: [
          Text(
            "Don't have an account?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.normal,
              fontSize: 12.sp,
            ),
          ),
          GestureDetector(
            child: Text(
              "Sign up here.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryElement,
                fontWeight: FontWeight.normal,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildThirdPartyLogin("Google", "google"),
            _buildThirdPartyLogin("Facebook", "facebook"),
            _buildThirdPartyLogin("Apple", "apple"),
            _buildOrWidget(),
            _buildThirdPartyLogin("phone number", ""),
            SizedBox(
              height: 35.h,
            ),
            _buildSignUpWidget()
          ],
        ),
      ),
    );
  }
}
