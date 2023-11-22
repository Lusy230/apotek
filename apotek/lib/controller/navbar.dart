import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class CustomCurvedNavigationBar extends StatefulWidget {
  @override
  _CustomCurvedNavigationBarState createState() => _CustomCurvedNavigationBarState();
}

class _CustomCurvedNavigationBarState extends State<CustomCurvedNavigationBar> {
  int _selectedIndex = 0;
  bool _isFloatingIconVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Curved Navigation Bar'),
      ),
      body: Center(
        child: Text('Page $_selectedIndex'),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF35385A).withOpacity(0.12),
              blurRadius: 30,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              child: Icon(FeatherIcons.home, size: 20),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              child: Icon(FeatherIcons.heart, size: 20),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isFloatingIconVisible = !_isFloatingIconVisible;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: _isFloatingIconVisible ? 30 : 0,
                child: Icon(FeatherIcons.plus, size: 20),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
              child: Icon(FeatherIcons.shoppingCart, size: 20),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 3;
                });
              },
              child: Icon(FeatherIcons.settings, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}