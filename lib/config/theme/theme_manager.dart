import 'package:evently_online_sat/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
    useMaterial3: false,
    iconTheme: IconThemeData(
      color: ColorsManager.black1C
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.whiteBlue,
      foregroundColor: ColorsManager.blue,
      titleTextStyle: GoogleFonts.roboto(fontSize: 18.sp, color: ColorsManager.blue, fontWeight: FontWeight.w400)
  , centerTitle: true,
    ),
    primaryColor: ColorsManager.blue,
    scaffoldBackgroundColor: ColorsManager.whiteBlue,
    cardTheme: CardThemeData(
      color: ColorsManager.whiteBlue,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),

      )
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: ColorsManager.blue,
      elevation: 16,
      shape: CircularNotchedRectangle(),

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedItemColor: ColorsManager.white,
      unselectedItemColor: ColorsManager.white
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.blue,
      foregroundColor: ColorsManager.white,
      shape: StadiumBorder(side: BorderSide(color: ColorsManager.white, width: 4))
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.grey, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
      labelStyle: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.grey,
      ),
      hintStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.grey,
      ),
      prefixIconColor: ColorsManager.grey,
      suffixIconColor: ColorsManager.grey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: REdgeInsets.symmetric(vertical: 16),
        backgroundColor: ColorsManager.blue,
        foregroundColor: ColorsManager.white,
        textStyle: GoogleFonts.inter(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.whiteBlue,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: REdgeInsets.symmetric(vertical: 16),
        side: BorderSide(color: ColorsManager.blue, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        )
      )
    ),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.white,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: ColorsManager.blue,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.white,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black1C,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14.sp,
        color: ColorsManager.black1C,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16.sp,
        color: ColorsManager.black1C,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.black1C,
      ),

    ),
  );




  static final ThemeData dark = ThemeData(
    useMaterial3: false,
    iconTheme: IconThemeData(
        color: ColorsManager.ofWhite
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.darkBlue,
      foregroundColor: ColorsManager.blue,
      titleTextStyle: GoogleFonts.roboto(fontSize: 18.sp, color: ColorsManager.blue, fontWeight: FontWeight.w400)
      , centerTitle: true,
    ),
    primaryColor: ColorsManager.darkBlue,
    scaffoldBackgroundColor: ColorsManager.darkBlue,
    cardTheme: CardThemeData(

        color: ColorsManager.darkBlue,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),

        )
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: ColorsManager.darkBlue,
      elevation: 16,
      shape: CircularNotchedRectangle(),

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: ColorsManager.ofWhite,
        unselectedItemColor: ColorsManager.ofWhite
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorsManager.darkBlue,
        foregroundColor: ColorsManager.ofWhite,
        shape: StadiumBorder(side: BorderSide(color: ColorsManager.ofWhite, width: 4))
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
      labelStyle: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.ofWhite,
      ),
      hintStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.ofWhite,
      ),
      prefixIconColor: ColorsManager.ofWhite,
      suffixIconColor: ColorsManager.ofWhite,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: REdgeInsets.symmetric(vertical: 16),
        backgroundColor: ColorsManager.blue,
        foregroundColor: ColorsManager.white,
        textStyle: GoogleFonts.inter(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.whiteBlue,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            padding: REdgeInsets.symmetric(vertical: 16),
            side: BorderSide(color: ColorsManager.blue, width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            )
        )
    ),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.ofWhite,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: ColorsManager.darkBlue,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.ofWhite,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.ofWhite,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14.sp,
        color: ColorsManager.ofWhite,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16.sp,
        color: ColorsManager.ofWhite,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.ofWhite,
      ),

    ),
  );
}
