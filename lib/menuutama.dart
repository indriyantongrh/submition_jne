import 'package:bms_mobile/view/home/homepage.dart';
import 'package:bms_mobile/view/menu/information.dart';
import 'package:bms_mobile/view/menu/datatabel.dart';
import 'package:bms_mobile/view/menu/akun.dart';
import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';


class MenuUtama extends StatefulWidget {
  @override
  _MenuUtamaState createState() => _MenuUtamaState();
}

class _MenuUtamaState extends State<MenuUtama> {
  int _selectedNavbar = 0;
  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
     // DataTables(),
    // Belanja(),
    Setting(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedNavbar),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text('Beranda', style: TextStyle(fontFamily: 'AirBnB', fontWeight: FontWeight.bold),),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            title: Text('Akun', style: TextStyle(fontFamily: 'AirBnB' , fontWeight: FontWeight.bold),),
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.redtelkomsel,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),

    );
  }
}
