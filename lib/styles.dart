import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryBlue = Color(0xFF4986CC);
Color secondaryBlue = Color(0xFF3F8AE0);
Color primaryBackground = Color(0xFFFFFFFF);
Color greyDiv = Color(0xFFD7D8D9);
Color greyBorder = Colors.grey.withOpacity(0.2);
Color greyField = Colors.grey.withOpacity(0.1);
Color hintTextGrey = Color(0xFF818C99);
Color textGrey = Color(0xFF6D7885);

TextStyle black20Bold = GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold));
TextStyle black16 = GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black, fontSize: 16));
TextStyle grey16hint = GoogleFonts.roboto(textStyle: TextStyle(color: hintTextGrey, fontSize: 16));
TextStyle grey14 = GoogleFonts.roboto(textStyle: TextStyle(color: textGrey, fontSize: 14));
TextStyle white18 = GoogleFonts.roboto(textStyle: TextStyle(color: Colors.white, fontSize: 18));
TextStyle blue16 = GoogleFonts.roboto(textStyle: TextStyle(color: primaryBlue, fontSize: 16));
TextStyle grey12 = GoogleFonts.roboto(textStyle: TextStyle(color: Colors.grey, fontSize: 12));
Widget backButton = Container(child: Icon(Icons.keyboard_arrow_left, color: primaryBlue, size: 32,), padding: EdgeInsets.all(2), color: Colors.transparent,);

String formateToLocalDate(DateTime date){
  var formatter = DateFormat('dd.MM.yyyy');
  return formatter.format(date);
}