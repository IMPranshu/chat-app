import 'package:chap/common/routes/pages.dart';
import 'package:chap/common/store/store.dart';
import 'package:chap/common/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'global.dart';

Future<void> main() async {
  // we can inject the User config using this method
  //but this is bad practice as we have no control over it
  //* Get.put<UserStore>(UserStore());
  // instead we use the below which is better architecture
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // as we are using Getx we have to wrap everything in "Get" controleler

    // we need to wrap this around screenutil for device-wise automatic resizing

    return ScreenUtilInit(
        designSize: const Size(360, 780),
        builder: (context, child) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: AppTheme.light,
              initialRoute: AppPages.INITIAL,
              getPages:
                  AppPages.routes, // all the routes are registered using this
            ));
  }
}
