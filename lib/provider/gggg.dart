// import 'package:flutter/material.dart';

// class Item extends ChangeNotifier {
//   Item(String name, Color color) {
//     _name = name;
//     _color = color;
//   }

//   int selectedIndex; // to know active index
//   String _name;
//   Color _color;

//   String getName() {
//     return _name;
//   }

//   void toggleSelected(int index) {
//     selectedIndex = index;

//     notifyListeners(); // To rebuild the Widget
//   }

//   void setColor(Color color) {
//     _color = color;

//     notifyListeners();
//   }

//   Color getColor() {
//     return _color;
//   }
// }