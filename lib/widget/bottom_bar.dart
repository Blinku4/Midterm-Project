import 'package:flutter/material.dart';
import 'package:mid_term_project/arcade_page.dart';
import 'package:mid_term_project/homepage.dart';

import '../downloads_page.dart';
import '../hot_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  final _pages = [
    HomePage(),
    ArcadePage(),
    HotPage(),
  DownloadsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      // 👇 Modern NavigationBar
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
       // optional background
        height: 60,                      // optional height
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.videogame_asset_outlined),
            selectedIcon: Icon(Icons.videogame_asset),
            label: 'Arcade',
          ),
          NavigationDestination(
            icon: Icon(Icons.play_arrow_outlined),
            selectedIcon: Icon(Icons.play_arrow),
            label: 'Hot',
          ),
          NavigationDestination(
            icon: Icon(Icons.save_alt_outlined),
            selectedIcon: Icon(Icons.save_alt),
            label: 'Downloads',
          ),
        ],
      ),
    );
  }
}
