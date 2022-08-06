import 'package:get/get.dart';
import 'package:sample_app/app/routes/app_pages.dart';

class AuthenController extends GetxController with StateMixin<bool> {
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    change(true, status: RxStatus.success());
    await 3.delay();
    Get.offNamed(Routes.HOME);
  }

  @override
  void onClose() {}
}
