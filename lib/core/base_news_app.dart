import 'package:base_news_app/core/constants.dart';
import 'package:base_news_app/navigation_bar/view/navigation_bar_page.dart';
import 'package:flutter/material.dart';

class BaseNewsApp extends StatelessWidget {
  const BaseNewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavigationBarPage(),
    );
  }
}
