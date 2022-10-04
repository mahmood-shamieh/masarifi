import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

TextDirection direction = TextDirection.rtl;

TextStyle getTextStyle({double? size, Color? color, FontWeight? fontWeight}) {
  return GoogleFonts.elMessiri(
      color: color, fontWeight: fontWeight, fontSize: size);
}

Widget getTextField(
    {TextDirection? textDirection,
    String? hintText,
    TextEditingController? textEditingController,
    TextInputType? textInputType,
    int? lineNumber}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      maxLines: lineNumber,
      controller: textEditingController,
      textDirection: textDirection,
      keyboardType: textInputType,
      decoration: InputDecoration(
        filled: true,
        border: UnderlineInputBorder(),
        hintText: hintText,
      ),
    ),
  );
}
