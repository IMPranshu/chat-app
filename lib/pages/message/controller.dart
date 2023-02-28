import 'package:get/get.dart';
import 'package:chap/pages/message/state.dart';

import '../../../common/routes/names.dart';

class MessageController extends GetxController {
  MessageController();

  final state = MessageState(); // created a variable as we can use it later

  void goProfile() async {
    await Get.toNamed(AppRoutes.Profile);
  }
}
