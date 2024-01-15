import 'package:flutter/material.dart';
import 'package:baby_countdown/core.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int _selectedIndex = 0;

  changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> widgetOptions = <Widget>[
    Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
    ),
    Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
    ),
    Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
    ),
  ];

  List navigationsIcons = [
    {
      'icon': Icons.add,
      'title': "Riwayat",
    },
    {
      'icon': Icons.home,
      'title': "Beranda",
    },
    {
      'icon': Icons.person_outline,
      'title': "Profile",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            activeIcon: Icon(Icons.add),
            label: 'Kartu Pasien',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey.shade400,
        showUnselectedLabels: true,
        selectedItemColor: primaryColor.shade700,
        onTap: changeIndex,
      ),
    );
  }
}
