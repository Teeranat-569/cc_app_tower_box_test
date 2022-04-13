import 'package:cc_app_tower_box_test/provider/provider_app.dart';
import 'package:cc_app_tower_box_test/style/color_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Buttons extends StatelessWidget {
  Color? color, color2;
  AnimationController? controller, controller2;
  late bool tap1;
  Function(TapDownDetails)? onTapDown;
  Function(TapUpDetails)? onTapUp;
  Function(TapUpDetails)? onTapUp2;
  Function(TapDownDetails)? onTapDown2;
  Orientation? orientation;
  Buttons(
      {Key? key,
      this.color,
      this.controller,
      this.onTapDown,
      this.onTapUp,
      this.color2,
      this.controller2,
      this.onTapDown2,
      this.onTapUp2,
      this.orientation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    TowerBoxProvider towerBoxProvider = Provider.of<TowerBoxProvider>(context);
    Size size = MediaQuery.of(context).size;
    return orientation == Orientation.portrait
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTapDown: onTapDown,
                onTapUp: onTapUp,
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
                        value: controller?.value,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTapDown: onTapDown2,
                onTapUp: onTapUp2,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: size.width * 0.2,
                      height: size.height * 0.10,
                      decoration: BoxDecoration(
                          color: color2,
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorApp.black)),
                      child: CircularProgressIndicator(
                        strokeWidth: 8,
                        value: controller2?.value,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : GestureDetector(
            onTapDown: onTapDown2,
            onTapUp: onTapUp2,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: size.width * 0.10,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                      color: color2,
                      shape: BoxShape.circle,
                      border: Border.all(color: ColorApp.black)),
                  child: CircularProgressIndicator(
                    strokeWidth: 8,
                    value: controller2?.value,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                ),
              ],
            ),
          );
  }
}
