import 'package:chap/common/entities/user.dart';
import 'package:get/get.dart';

class MessageState {
// the variable that will change over time will be kept here

// this is used for the user profile photo
  var head_detail = UserItem()
      .obs; // in this class if t=we change anything it will be reactive
}
