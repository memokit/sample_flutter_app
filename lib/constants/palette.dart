import 'package:flutter/material.dart';

//
class Palette {
  static const Color backgroundColor = Color(0xFFE4E9F2);
  static const Color primary = Color(0xFF5284BC);
  static const Color secondary = Color(0xFF37526d);
  static const Color headline = Color(0xFFedb10c);
  static const Color textPrimary = Color(0xFF4E586E);
  static const Color textSecondary = Color(0xFF8C9BB3);
  static const Color white = Color(0xffffffff);
  static const Color grey = Color(0xFF323232);
  static const Color greyShade400 = Color(0xFFCFD6E1);
  static const Color greyShade500 = Color(0xFF8C9BB3);
  static const Color greyLight = Color(0xFFEEEEEE);
  static const Color orange = Color(0xFFF27120);
  static const Color orangeLight = Color(0xFFf7a979);
  static const Color purple = Color(0xFF6768ab);
  static const Color purpleLight = Color(0xFFd7d4f1);
  static const Color blue = Color(0xFF086191);
  static const Color blueLight = Color(0xFFbbd8fb);
  static const Color green = Color(0xFF54857a);
  static const Color gold = Color(0xFFcd9900);
  static const Color red = Color(0xFFf94e4e);

  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [Color(0xFF496AE1), Color(0xFFCE48B1)],
  );

  static const Color online = Color(0xFF4BCB1F);

  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],
  );
}
