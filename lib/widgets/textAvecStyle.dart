import 'package:flutter/material.dart';

class TextAvecStyle extends Text{
  TextAvecStyle(String data, {textAlign: TextAlign.center, color: Colors.indigo, fontStyle: FontStyle.italic, fontSize: 20.0, fontWeight: FontWeight.normal}) :
    super(
      data,
      textAlign: textAlign,
      style: new TextStyle(
        color: color,
        fontSize: fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeight
      ));
}