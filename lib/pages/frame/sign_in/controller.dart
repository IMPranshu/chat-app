import 'package:chap/common/entities/user.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:chap/pages/frame/sign_in/state.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common/routes/names.dart';

class SignInController extends GetxController {
  SignInController();

  final state = SignInState();
  // created a variable as we can use it later

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    // scope is how you want to login
    'openid', // openid is a concept where we use one account to sign in to multiple devices. this was introduced by google
  ]);

  void handleSignIn(String type) async {
    // 1. Email 2. Google 3. Facebook 4. Apple 5. Phone
    // as login is a complicated process we are using try and catch block
    try {
      if (type == "phone number") {
        print("....You are logging in with phone number....");
      } else if (type == "google") {
        // as here we have to wait for the server to respond so we are using async and await together
        var user = await _googleSignIn.signIn();
        if (user != null) {
          String? displayName = user
              .displayName; // Signin method used above return multiple things and username is one of those. Name might not be setup so it can be a null so that is why we are using "?"
          String email = user
              .email; // if there is a user then there must be an email id of that user for a google account
          String id = user.id; // id cannot be null as well
          String photoUrl = user.photoUrl ??
              "assets/icons/google.png"; // "??" if photoUrl present/true then use it/left statement otherwise use the right statment

          // we want to create an User "object" as we want all the above 4 variables that we want to put in one.
          // when we have a lot of fields for a particulat entity we create an object and put all those fields into one
          LoginRequestEntity loginPanelListRequestEntity = LoginRequestEntity();
          loginPanelListRequestEntity.avatar = photoUrl;
          loginPanelListRequestEntity.name = displayName;
          loginPanelListRequestEntity.email = email;
          loginPanelListRequestEntity.open_id = id;
          loginPanelListRequestEntity.type = 2;
          asyncPostAllData();
        }
      } else {
        if (kDebugMode) {
          print("...login type not sure");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("...error with login $e");
      }
    }
  }

  // this method is very important
  // it would load all the async data meaning it would load data from dserver
  // in general when "async" is used then it generally does some networking and/or loading work from storage and it will take a bot of time

  // as we have signin method so after each signin we will call this method
  asyncPostAllData() {
    // this is the place where we will the routing
    print("... let's go to message page....");
    Get.offAllNamed(AppRoutes.Message);
  }
}
