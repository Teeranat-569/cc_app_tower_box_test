// import 'package:flutter/material.dart';

// class MyList extends StatelessWidget {
//   final List<Item> items;
//   final List<int> selectedItemIdList;
//   final void Function(Item) onLongClick;

//   MyList(this.items, this.selectedItemIdList, this.onLongClick);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (context, position) {
//         //remember all you need to do here is to create your item based on the data you have
//         var item = items[position];
//         var isSelected = items.firstWhere((element) => item.id == element.id) != null;
//         if (isSelected) {
//           //build and return a widget with selected look
//         } else {
//           return GestureDetector(
//             onLongPress: () => onLongClick(item), //changes data in homepage then MyList will be updated automatically
//             child: Container(
//               //rest of your widget
//             ),
//           );
//         }
//       },
//       itemCount: items.length,
//     );
//   }
// }