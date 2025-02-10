import 'package:flutter/material.dart';

OutlineInputBorder kOutlineInputBorder(Color? color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide:
        color != null ? BorderSide(color: color, width: 2.0) : BorderSide.none);
