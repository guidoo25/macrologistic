import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:macrologistic/screens/conductor/list_viaJes.dart';
import 'package:macrologistic/screens/homescreen.dart';
import 'package:macrologistic/screens/maps/mapview.dart';
import 'package:macrologistic/screens/perfil/perfil.dart';

class navbar extends StatefulWidget {
  static const name = 'homeScreen';
  @override
  State<navbar> createState() => _homeScreenState();
}

class _homeScreenState extends State<navbar> {
  int selectedIndex = 0;
  final screens = [ListViajes(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: CupertinoTabBar(
        // Use CupertinoTabBar for Apple-like appearance
        backgroundColor: Colors.white,
        activeColor: Colors.white,

        currentIndex: selectedIndex,
        onTap: ((value) => setState(() => selectedIndex = value)),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home_filled),
            backgroundColor: color.primary,
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person),
            label: 'viajes',
            backgroundColor: color.primary,
          ),
        ],
      ),
    );
  }
}
