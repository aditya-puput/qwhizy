import 'package:flutter/material.dart';

class AppFontStyle {
  static TextStyle boldText =
      const TextStyle(fontSize: 16, fontFamily: "Baloo", height: 1);
  static TextStyle normalText =
      const TextStyle(fontSize: 14, fontFamily: "Baloo2", height: 1);
        static TextStyle simpleListText =
      const TextStyle(fontSize: 16, fontFamily: "Baloo");
  static TextStyle accountNameText = const TextStyle(
    fontSize: 18,
    fontFamily: "Baloo",
    height: 1.1,
  );
  static TextStyle homeItemText = const TextStyle(
    fontSize: 16,
    fontFamily: "Baloo",
    height: 1,
  );
  static TextStyle accountUsernameText = const TextStyle(
    fontSize: 14,
    fontFamily: "Baloo2",
    height: 1.1,
  );
  static TextStyle authTitleText = const TextStyle(
    fontSize: 32,
    fontFamily: "Baloo",
  );
  static TextStyle authLabelText = const TextStyle(
    fontSize: 16,
    fontFamily: "Baloo",
  );
  static TextStyle authInputText =
      const TextStyle(fontSize: 14, fontFamily: "Baloo2");
  static TextStyle authHintText = const TextStyle(
      color: Color(0xFF9EA3A2), fontSize: 14, fontFamily: "Baloo2");
  static TextStyle authSmallText =
      const TextStyle(fontSize: 12, fontFamily: "Baloo2");
  static TextStyle authSmallBoldText = TextStyle(
      fontSize: 12,
      fontFamily: "Baloo2",
      fontWeight: FontWeight.bold,
      shadows: const [
        Shadow(
          blurRadius: 8,
          color: Color(0x663CEAC1),
        ),
        Shadow(
          blurRadius: 8,
          color: Color(0x6600C0DA),
        ),
      ],
      foreground: Paint()
        ..shader = const LinearGradient(
          colors: [
            Color(0xFF3CEAC1),
            Color(0xFF00C0DA),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)));
  static TextStyle tabText = TextStyle(
    fontSize: 28,
    fontFamily: "Baloo",
    color: const Color(0xFF6E6E6E).withOpacity(.5),
    height: .1
  );
  static TextStyle tabActiveText = TextStyle(
      fontSize: 28,
      fontFamily: "Baloo",
      height: .1,
      shadows: const [
        Shadow(
          blurRadius: 8,
          color: Color(0x663CEAC1),
        ),
        Shadow(
          blurRadius: 8,
          color: Color(0x6600C0DA),
        ),
      ],
      foreground: Paint()
        ..shader = const LinearGradient(
          colors: [
            Color(0xFF3CEAC1),
            Color(0xFF00C0DA),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)));
    
}
