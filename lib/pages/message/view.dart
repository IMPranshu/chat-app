// this is the place we have our UI
import 'package:chap/common/values/values.dart';
import 'package:chap/pages/message/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagePage extends GetView<MessageController> {
  // as we have used GetView<> now we can access the variables from WelcomeController here
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
