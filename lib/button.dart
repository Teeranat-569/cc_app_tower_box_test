import 'package:cc_app_tower_box_test/provider/provider_app.dart';
import 'package:cc_app_tower_box_test/style/color_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Buttons extends StatelessWidget {
  Color color;
  AnimationController controller;
  late bool tap1;
  late Function onTapDown;
  late Function onTapUp;

  Buttons({Key? key, required this.color, required this.controller,required this.onTapDown,required this.onTapUp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    TowerBoxProvider towerBoxProvider = Provider.of<TowerBoxProvider>(context);
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTapDown: (_) => onTapDown,
      onTapUp: (_) =>onTapUp,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: size.width * 0.2,
            height: size.height * 0.10,
            decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(color: ColorApp.black)),
            child: CircularProgressIndicator(
              strokeWidth: 8,
              value: controller.value,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
