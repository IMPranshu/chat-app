// inside this we will loading everything which is global
// we will also be loading them using Flutter "future" and async methods

import 'package:chap/common/services/services.dart';
import 'package:chap/common/store/store.dart';
import 'package:chap/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// this is better architecture

class Global {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    // this method is required for sucessfully logging into the app
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // in StorageService we have used inIt method which returns "Future" and is async
    // if we want to load these type of controller we have to use putAsync to load it
    // becuase it returns Future and it may delay for uncertain amount of time and to make sure that nothing crashes, we use putAsync
    // also in database operation then it is saved in  GetxService methods and it returns future. In this case we use Get.putAsync to load and insert in the memory and so that we wait until everything is saved/done
    await Get.putAsync<StorageService>(() => StorageService().init());
    Get.put<UserStore>(UserStore());

    // if we have an app sign in functionality and no logout option and try to login again and again
    // as we are already in login state. o we have to provide an option to logout
  }
}
