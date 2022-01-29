import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex('FFFFFF');
  static Color red = HexColor.fromHex('FF0000');
  static Color green = HexColor.fromHex('40D81A');
  static Color whiteWithOpecity1 = HexColor.fromHex('F6F6F6');
  static Color whiteWithOpecity2 = HexColor.fromHex('FAFAFA');
  static Color grey = HexColor.fromHex('848484');
  static Color black = HexColor.fromHex('131313');
  static Color blue = HexColor.fromHex('243f6f');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF' + hexColorString;
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
