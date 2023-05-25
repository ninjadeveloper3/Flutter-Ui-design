import 'package:flutter/material.dart';

class Col {
  static const bodyBackground = Color.fromRGBO(243, 243, 243, 1);
  static const primaryColor = Color.fromRGBO(71, 106, 204, 1);
  static const grey = Color.fromRGBO(177, 177, 177, 1);
  static const black = Color.fromRGBO(0, 0, 0, 1);

  /// side padding
  static const ksidePadding = 15.00;
  // final Colsd = HexColor('#E5EDEF');

  //// App fonts
  static const appbarHeaderTextSize = 14.00;
  static const standardSpace = 12.00;
  static const standardsmallSpace = 0.00;
  static const heading = 17.00;

//// status color
  static const ongoing = Color.fromRGBO(71, 106, 204, 1);
  static const completed = Color.fromRGBO(86, 205, 240, 1);
  static const inprogress = Color.fromRGBO(75, 232, 193, 1);
  static const cancel = Color.fromRGBO(137, 120, 249, 1);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
