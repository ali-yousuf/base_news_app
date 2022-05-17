import 'package:base_news_app/core/constants.dart';
import 'package:base_news_app/navigation_bar/view/navigation_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import '../favourite/cubit/favourite_cubit.dart';
import '../settings/settings.dart';

class BaseNewsApp extends StatelessWidget {
  const BaseNewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = GetStorage().read(Constants.isDarkThemeEnable)?? false;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit(isDark)),
        BlocProvider(
            lazy: false,
            create: (context) => FavouriteCubit()..getFavourites()),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            title: Constants.appName,
            debugShowCheckedModeBanner: false,
            theme: state ? ThemeData.dark() : ThemeData.light(),
            home: const NavigationBarPage(),
          );
        },
      ),
    );
  }
}
