import 'package:base_news_app/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';

import '../Dimension/dimension.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    appBarTheme: AppBarTheme(
      color: AppColors.primary,
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
    ),
    primaryColorDark: AppColors.primary,
    primaryColorLight: AppColors.Primary_Lite,
    scaffoldBackgroundColor: AppColors.Background,
    dividerColor: Colors.white,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
    ),
    cardTheme: CardTheme(shadowColor: AppColors.Card_Shadow),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.Primary2,
    ),
    iconTheme: IconThemeData(color: AppColors.Icon_Color),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(color: AppColors.primary),
        unselectedIconTheme: const IconThemeData(color: Colors.black45)),
    textTheme: TextTheme(
        headline1: TextStyle(
            color: AppColors.Text_Color,
            fontSize: Dimension.Text_Size_Big,
            fontWeight: Dimension.textBold),
        headline2: TextStyle(
            color: AppColors.Text_Color,
            fontSize: Dimension.Text_Size,
            fontWeight: Dimension.textBold),
        headline3: TextStyle(
            color: AppColors.Text_Color,
            fontSize: Dimension.Text_Size_Small,
            fontWeight: Dimension.semiBold),
        headline4: TextStyle(
            color: AppColors.Text_Color,
            fontSize: Dimension.Text_Size_Small_Extra,
            fontWeight: Dimension.semiBold),
        subtitle1: TextStyle(
            color: AppColors.Text_Color,
            fontSize: Dimension.Text_Size,
            fontWeight: Dimension.textNormal),
        bodyText1: TextStyle(
            color: AppColors.Text_Color,
            fontSize: Dimension.Text_Size,
            fontWeight: Dimension.textNormal),
        bodyText2: TextStyle(
            color: AppColors.Text_Color,
            fontSize: Dimension.Text_Size_Small,
            fontWeight: Dimension.textNormal),
        headline6: TextStyle(
            color: AppColors.Text_Color,
            fontSize: Dimension.Text_Size_Small_Extra,
            fontWeight: Dimension.textNormal)),
  );
  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
    ),
    primaryColorDark: AppColors.primary,
    primaryColorLight: AppColors.Primary_Lite,
    scaffoldBackgroundColor: AppColors.Primary_Dark,
    dividerColor: Colors.grey,
    bottomAppBarColor: Colors.black,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.black45,
    ),
    cardTheme: CardTheme(shadowColor: AppColors.Card_Shadow),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.Primary2,
    ),
    iconTheme: IconThemeData(color: AppColors.white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedIconTheme: IconThemeData(color: AppColors.primary),
        unselectedIconTheme: IconThemeData(color: AppColors.white),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.white),
    textTheme: TextTheme(
        headline1: TextStyle(
            color: AppColors.white,
            fontSize: Dimension.Text_Size_Big,
            fontWeight: Dimension.textBold),
        headline2: TextStyle(
            color: AppColors.white,
            fontSize: Dimension.Text_Size,
            fontWeight: Dimension.textBold),
        headline3: TextStyle(
            color: AppColors.white,
            fontSize: Dimension.Text_Size_Small,
            fontWeight: Dimension.semiBold),
        headline4: TextStyle(
            color: AppColors.white,
            fontSize: Dimension.Text_Size_Small_Extra,
            fontWeight: Dimension.semiBold),
        subtitle1: TextStyle(
            color: AppColors.white,
            fontSize: Dimension.Text_Size,
            fontWeight: Dimension.textNormal),
        bodyText1: TextStyle(
            color: AppColors.white,
            fontSize: Dimension.Text_Size,
            fontWeight: Dimension.textNormal),
        bodyText2: TextStyle(
            color: AppColors.Text_Color,
            fontSize: Dimension.Text_Size_Small,
            fontWeight: Dimension.textNormal),
        headline6: TextStyle(
            color: AppColors.white,
            fontSize: Dimension.Text_Size_Small_Extra,
            fontWeight: Dimension.textNormal)),
  );
}
