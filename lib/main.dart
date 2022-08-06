import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configLoading();

  runApp(
    GetMaterialApp(
      title: "Sample App",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
    ),
  );
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 25
    ..radius = 30
    ..contentPadding = const EdgeInsets.symmetric(vertical: 15, horizontal: 10)
    ..progressColor = Colors.grey.shade100
    ..backgroundColor = Colors.grey.shade400.withOpacity(0.5)
    ..indicatorColor = Colors.grey.shade100
    ..textColor = Colors.grey.shade100
    ..maskType = EasyLoadingMaskType.black
    ..maskColor = Colors.grey.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}
