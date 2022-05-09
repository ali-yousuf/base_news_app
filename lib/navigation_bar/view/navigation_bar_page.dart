import 'package:flutter/material.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({Key? key}) : super(key: key);

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  PageController pageController = PageController(initialPage: 0);

  static final List<Widget> _widgetOptions = <Widget>[
    const Center(child: Text('home: index 0')),
    const Center(child: Text('favourite: index 1')),
    const Center(child: Text('settings: index 2')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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
  }
}
