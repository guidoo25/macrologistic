import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:macrologistic/screens/conductor/list_viaJes.dart';
import 'package:macrologistic/screens/homescreen.dart';
import 'package:macrologistic/screens/maps/mapview.dart';

class navbar extends StatefulWidget {
  static const name = 'homeScreen';
  @override
  State<navbar> createState() => _homeScreenState();
}

class _homeScreenState extends State<navbar> {
  int selectedIndex = 0;
  final screens = [Homescreen(), ListViajes(), SimpleExample()];

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: CupertinoTabBar( // Use CupertinoTabBar for Apple-like appearance
        backgroundColor: color.primary,
        activeColor: Colors.white,
        
        currentIndex: selectedIndex,
        onTap: ((value) => setState(() => selectedIndex = value)),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental_rounded),
            activeIcon: Icon(Icons.car_rental),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.travel_explore_rounded),
            activeIcon: Icon(Icons.travel_explore_rounded),
            label: 'viajes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_sharp),
            activeIcon: Icon(Icons.list),
            label: 'perfil',
          ),
        ],
      ),
    );
  }
}