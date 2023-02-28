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

  Widget _headBar() {
    return Center(
      child: Container(
        width: 320.w,
        height: 44.w,
        margin: EdgeInsets.only(bottom: 20.h, top: 20.h),
        child: Row(
          children: [
            Stack(
              children: [
                GestureDetector(
                  // becuase we want the icon to be clickable
                  child: Container(
                    width: 44.h,
                    height: 44.h,
                    decoration: BoxDecoration(
                        color: AppColors.primarySecondaryBackground,
                        borderRadius: BorderRadius.all(Radius.circular(22.h)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          )
                        ]),
                    // here we will check if user has any profile photo or not
                    child: controller.state.head_detail.value.avatar == null
                        ? Image(
                            image:
                                AssetImage("assets/images/account_header.png"),
                          )
                        : Text("hi"),
                  ),
                  onTap: () {
                    controller.goProfile();
                  },
                ),
                // we want to show the online green dot on the image
                Positioned(
                  bottom: 5.w,
                  right: 0.w,
                  height: 14.w,
                  child: Container(
                    width: 14.w,
                    height: 14.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.w, color: AppColors.primaryElementText),
                        color: AppColors.primaryElementStatus,
                        borderRadius: BorderRadius.all(Radius.circular(12.w))),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // slivers
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        // when we have some fixed items and want them to get along with overlapping items we use Stack
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true, // we dont want the appbar to be scrollable
                title: _headBar(),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
