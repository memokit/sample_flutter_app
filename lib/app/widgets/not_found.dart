import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:sample_app/constants/palette.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(
          Linecons.search,
          size: 50,
          color: Palette.greyShade500,
        ),
        SizedBox(height: 5),
        Text(
          "ไม่พบข้อมูล",
          style: TextStyle(
            color: Palette.greyShade500,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
