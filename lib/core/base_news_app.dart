import 'package:base_news_app/core/constants.dart';
import 'package:base_news_app/core/themes/app_themes.dart';
import 'package:base_news_app/core/themes/cubit/theme_cubit.dart';
import 'package:base_news_app/navigation_bar/view/navigation_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseNewsApp extends StatelessWidget {
  const BaseNewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, state) {
          return MaterialApp(
            title: Constants.appName,
            debugShowCheckedModeBanner: false,
            theme: state ? AppThemes.darkTheme : AppThemes.lightTheme,
            home: const NavigationBarPage(),
          );
        },
      ),
    );
  }
}
