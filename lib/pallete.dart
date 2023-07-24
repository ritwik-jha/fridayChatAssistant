import 'package:flutter/material.dart';

class Pallete {
  static const Color mainFontColor = Color.fromRGBO(19, 61, 95, 1);
  static const Color firstSuggestionBoxColor = Color(0xff128c7e);
  static const Color secondSuggestionBoxColor = Color(0xff075e54);
  static const Color thirdSuggestionBoxColor = Color(0xff25d366);
  static const Color assistantCircleColor = Color.fromRGBO(209, 243, 249, 1);
  static const Color borderColor = Color.fromRGBO(200, 200, 200, 1);
  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color appbarColor = Color(0xFF232D36);
  static const Color backgroudColor = Color(0xFF101D25);
  static const Color textColor = Color(0xffD8DFE5);
  static const Color textPromptColor = Color(0xff054640);
  static const Color convoColor = Color(0xffC3DDDC);
  static const Color textfieldColor = Color(0xff2d383e);

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
