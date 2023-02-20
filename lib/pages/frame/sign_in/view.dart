// this is the place we have our UI
import 'package:chap/common/values/values.dart';
import 'package:chap/pages/frame/sign_in/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPage extends GetView<SignInController> {
  // as we have used GetView<> now we can access the variables from WelcomeController here
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
