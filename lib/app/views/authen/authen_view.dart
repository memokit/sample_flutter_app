import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sample_app/app/controllers/authen/authen_controller.dart';
import 'package:sample_app/components/layout.dart';
import 'package:sample_app/constants/image_assets.dart';
import 'package:sample_app/constants/palette.dart';

class AuthenView extends GetView<AuthenController> {
  AuthenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      children: [
        ContainerBox(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Center(
                  child: Text(
                    "Restaurant App",
                    style: TextStyle(
                      color: Palette.primary,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      width: Get.width,
                      child: Image.asset(
                        ImageAssets.backgroundTop,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: Get.width,
                      child: Image.asset(
                        ImageAssets.backgroundBottom,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                controller.obx(
                  (state) => const Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 50,
                      child: LoadingIndicator(
                        indicatorType: Indicator.pacman,
                        colors: [
                          Palette.blue,
                          Colors.green,
                          Colors.red,
                          Colors.orange,
                          Colors.yellow,
                        ],
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
