import 'package:flutter/material.dart';

class AppStyle {
  static Color accent = Color(0xfffcb130);

  static TextStyle standard = TextStyle(
    fontFamily: "Sigvar",
    color: accent,
  );

  static final caption = TextStyle(
    color: Colors.grey[700],
    fontSize: 16,
  );

  static final subtitle = TextStyle(
    fontSize: 16,
  );

  static final mediumHeader = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w500,
  );
}