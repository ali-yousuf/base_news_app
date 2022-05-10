import 'package:base_news_app/navigation_bar/cubit/bottom_nav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/home.dart';
import '../../settings/settings.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({Key? key}) : super(key: key);

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  PageController pageController = PageController(initialPage: 0);

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const Center(child: Text('favourite: index 1')),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: PageView(
              controller: pageController,
              children: _widgetOptions,
              physics: const NeverScrollableScrollPhysics(),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).bottomAppBarColor,
              currentIndex: state,
              onTap: (index) {
                context.read<BottomNavCubit>().onItemTapped(index);
                changeTab(index);
              },
              selectedIconTheme: Theme.of(context).bottomNavigationBarTheme.selectedIconTheme,
              unselectedIconTheme: Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme,
              items: const [
                BottomNavigationBarItem(
                    label: 'home',
                    icon: Icon(Icons.home),
                    activeIcon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: 'favourite',
                    icon: Icon(Icons.favorite),
                    activeIcon: Icon(Icons.favorite)),
                BottomNavigationBarItem(
                    label: 'settings',
                    icon: Icon(Icons.settings),
                    activeIcon: Icon(Icons.settings))
              ],
            ),
          );
        },
      ),
    );
  }

  void changeTab(int index){
    pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
