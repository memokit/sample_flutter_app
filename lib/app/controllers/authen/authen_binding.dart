import 'package:get/get.dart';

import 'authen_controller.dart';

class AuthenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenController>(
      () => AuthenController(),
    );
  }
}
