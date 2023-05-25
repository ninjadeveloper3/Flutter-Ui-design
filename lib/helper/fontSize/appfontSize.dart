import 'dart:math';

import 'package:flutter/material.dart';

class AppDynamic {
  static double dynamicSize(BuildContext context, double size) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double diagonalSize = sqrt(pow(screenHeight, 2) +
        pow(screenWidth, 2)); // calculate diagonal size of screen

    // adjust font size based on diagonal size
    double adjustedSize = size * (diagonalSize / 720);

    return adjustedSize;
  }
}
