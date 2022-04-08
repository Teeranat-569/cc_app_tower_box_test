import 'package:cc_app_tower_box_test/provider/provider_app.dart';
import 'package:cc_app_tower_box_test/style/color_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Buttons extends StatelessWidget {
  Color color;
  Buttons({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TowerBoxProvider towerBoxProvider = Provider.of<TowerBoxProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.18,
      height: size.height * 0.10,
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: ColorApp.black)),
      child: GestureDetector(
        onTap: () {
          print(color);
          towerBoxProvider.onTap();
        },
      ),
    );
  }
}
