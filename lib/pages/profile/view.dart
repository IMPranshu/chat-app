// this is the place we have our UI
import 'package:chap/common/values/values.dart';
import 'package:chap/pages/profile/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  AppBar _buildAppbar() {
    return AppBar(
      title: Text(
        "Profile",
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Stack(
      children: [Container()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppbar(),
        body: SafeArea(
            child: CustomScrollView(
          slivers: [
            // silver to box Adapter - it works silver and non-slive widgets
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  children: [],
                ),
              ),
            )
          ],
        )));
  }
}
