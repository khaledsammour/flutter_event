import 'package:flutter/cupertino.dart';
import 'package:flutter_event_1/pressentation/resource/valuesManager.dart';

TextStyle _getTextStyle(double fontSize, Color color, FontWeight fontWeight) {
  return TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight);
}

TextStyle getNormalStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    FontWeight fontWeight = FontWeight.normal}) {
  return _getTextStyle(fontSize, color, fontWeight);
}

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    FontWeight fontWeight = FontWeight.bold}) {
  return _getTextStyle(fontSize, color, fontWeight);
}
