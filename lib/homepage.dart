import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_167/screen/dashboard.dart';
import 'package:flutter_application_167/screen/deliveries.dart';
import 'package:flutter_application_167/screen/orders.dart';
import 'package:flutter_application_167/screen/profilepage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int selectedIndex = 0;
  final screen = [Dashboard(), Deliveries(), Orders(), Profilepage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
        items: [
          Icon(
            Icons.home,
            size: 30,
          ),
          Icon(Icons.shopping_bag, size: 30),
          Icon(Icons.rss_feed, size: 30),
          Icon(Icons.person, size: 30)
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        animationCurve: Curves.easeIn,
      ),
      body: screen[selectedIndex],
    );
  }
}
