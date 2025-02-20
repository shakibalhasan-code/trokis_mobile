import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {

static Color primaryColor = Colors.black;
static Color whiteColor = Colors.white;
static Color primaryBgColor = Color(0xffF2F5F7);
static Color textColor = Color(0xff545454);
static Color simpleBlack = Color(0xffE6E6E6);


static TextStyle titleMedium = GoogleFonts.montserrat(
  fontSize: 18.sp,
  fontWeight: FontWeight.w500,
  color: textColor);

static TextStyle titleLarge = GoogleFonts.montserrat(
  fontSize: 20.sp,
  fontWeight: FontWeight.w700,
  color: textColor);
}