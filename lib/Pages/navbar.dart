import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_homescreen/Pages/homescreen.dart';
import 'package:food_homescreen/customIcons/my_icons_icons.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {


  int _index = 1;


  @override
  Widget build(BuildContext context) {
    Widget child;

    switch (_index) {
      case 0:
        child = HomeScreen();
        break;
      case 1:
        child = HomeScreen();
        break;
      case 2:
        child = HomeScreen();
        break;
    }

    return Scaffold(
      body: SizedBox.expand(child: child),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.deepOrange,
        onTap: (newIndex) => setState(() => _index = newIndex),
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(icon: Icon(MyIcons.category,size: 30,), title: Text("CATEGORIES")),
          BottomNavigationBarItem(icon: Icon(MyIcons.home,size: 30,), title: Text("HOME")),
          BottomNavigationBarItem(icon: Icon(MyIcons.note,size: 30,), title: Text("ORDERS")),
        ],
      ),
    );
  }
}
