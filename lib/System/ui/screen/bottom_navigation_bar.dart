import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  MyBottomNavigationBar();
  _MyBottomNavigationBar createState() => _MyBottomNavigationBar();
}

class _MyBottomNavigationBar extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: null, //onTabTapped, // new
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.add_location),
          label: 'Checkpoint',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          label: 'Tareas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.adjust_outlined),
          label: 'Ubicación',
        ),
      ],
    );
  }
}
