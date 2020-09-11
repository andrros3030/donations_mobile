import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color primaryBlue = Color(0xFF4986CC);
Color primaryBackground = Color(0xFFFFFFFF);
Color greyDiv = Color(0xFFD7D8D9);
Color greyBorder = Colors.grey.withOpacity(0.2);
Color greyField = Colors.grey.withOpacity(0.1);
Color hintTextGrey = Color(0xFF818C99);
Color textGrey = Color(0xFF6D7885);

TextStyle black20Bold = TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
TextStyle black16 = TextStyle(color: Colors.black, fontSize: 16);
TextStyle grey16hint = TextStyle(color: hintTextGrey, fontSize: 16);
TextStyle grey14 = TextStyle(color: textGrey, fontSize: 14);
TextStyle white18 = TextStyle(color: Colors.white, fontSize: 18);
TextStyle blue16 = TextStyle(color: primaryBlue, fontSize: 16);
TextStyle grey12 = TextStyle(color: Colors.grey, fontSize: 12);
Widget backButton = Container(child: Icon(Icons.keyboard_arrow_left, color: primaryBlue, size: 32,), padding: EdgeInsets.all(2), color: Colors.transparent,);