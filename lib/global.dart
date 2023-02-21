// inside this we will loading everything which is global
// we will also be loading them using Flutter "future" and async methods

import 'package:chap/common/services/services.dart';
import 'package:chap/common/store/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// this is better architecture

class Global {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Get.putAsync<StorageService>(() => StorageService().init());
    Get.put<UserStore>(UserStore());
  }
}
