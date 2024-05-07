
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:macrologistic/screens/conductor/list_viaJes.dart';
import 'package:macrologistic/screens/homescreen.dart';

class navbar extends StatefulWidget {
  static const name = 'homeScreen';
  @override
  State<navbar> createState() => _homeScreenState();
}

class _homeScreenState extends State<navbar> {
  int selectedIndex = 0;
  final screens = [Homescreen(), ListViajes(), Container()];

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 12,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        onTap: ((value) => setState(() => selectedIndex = value)),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental_rounded),
            activeIcon: Icon(Icons.car_rental),
            backgroundColor: color.primary,
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.travel_explore_rounded),
            activeIcon: Icon(Icons.travel_explore_rounded),
            label: 'viajes',
            backgroundColor: color.primary,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_sharp),
            activeIcon: Icon(Icons.list),
            label: 'perfil',
            backgroundColor: color.primary,
          ),
        ],
      ),
    );
  }
}