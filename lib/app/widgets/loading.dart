import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatelessWidget {
  final bool isShow;
  final String label;
  const Loading({
    Key? key,
    this.isShow = true,
    this.label = "กำลังโหลด...",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isShow
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
                child: LoadingAnimationWidget.discreteCircle(
              color: Colors.orange,
              size: 30,
              secondRingColor: Colors.green,
              thirdRingColor: Colors.purple,
            )),
          );
  }
}
