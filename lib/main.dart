// ignore_for_file: avoid_print
import 'dart:math' as math;

import 'package:cc_app_tower_box_test/button.dart';
import 'package:cc_app_tower_box_test/style/triangle.dart';
import 'package:cc_app_tower_box_test/provider/provider_app.dart';
import 'package:cc_app_tower_box_test/style/color_app.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TowerBoxProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  bool tap1 = false, tap2 = false, tapPink = false, tap3 = true, tap4 = true;
  late Animation<double> animation, animation2;
  late AnimationController controller, controller2;
  double h = 0.0;
  List<dynamic> kk = [];
  int level = 0;
  late Orientation portrait, landscape;
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<TowerBoxProvider>(context, listen: false);
    provider.tower(level);
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    controller2 =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation2 = Tween<double>(end: 0).animate(controller2)
      ..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(end: 0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    print('*********************' + level.toString());
    level = 0;
  }

  resetTime() {
    level = 0;
    // counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TowerBoxProvider towerBoxProvider = Provider.of<TowerBoxProvider>(context);
    return Scaffold(
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          portrait = Orientation.portrait;
          landscape = Orientation.landscape;
          return orientation == Orientation.portrait
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    horizonBox(size, towerBoxProvider, orientation),
                    GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(
                            msg:
                                "กดปุ่มสีที่ตรงกัน\nค้างไว้ 2 วินาที\nเพื่อทำลาย Block",
                            gravity: ToastGravity.CENTER,
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                      child: Container(
                        width: size.width,
                        height: size.height * 0.1625,
                        color: Colors.white,
                        child: Buttons(
                          orientation: Orientation.portrait,
                          controller2: controller2,
                          color2: ColorApp.blue,
                          color: ColorApp.pink,
                          controller: controller,
                          onTapDown: (_) {
                            controller.forward().whenComplete(() {
                              tap1 = true;
                              towerBoxProvider.tapPinks(level++, context);
                              print('tap1' + tap1.toString());
                              towerBoxProvider.tapAll(tap1, tap2, 0, context);
                              print('dddddddddddddddddd---------' +
                                  level.toString());
                              controller.reset();
                            });
                          },
                          onTapUp: (_) {
                            tap1 = false;
                            print('tap1' + tap1.toString());
                            if (controller.status == AnimationStatus.forward) {
                              controller.reverse();
                            }
                          },
                          onTapDown2: (_) {
                            controller2.forward().whenComplete(() {
                              setState(() {
                                tap2 = true;
                              });
                              towerBoxProvider.tapBlues(level++, context);
                              tap4 = false;
                              print('dddddddddddddddddd---------' +
                                  level.toString());
                              towerBoxProvider.tapAll(tap2, tap1, 0, context);
                              print('tap2' + tap2.toString());
                              controller2.reset();
                            });
                          },
                          onTapUp2: (_) {
                            tap2 = false;
                            print('tap2' + tap2.toString());
                            if (controller2.status == AnimationStatus.forward) {
                              controller2.reverse();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.bottomCenter,
                      color: ColorApp.white,
                      height: size.height,
                      width: size.width * 0.1625,
                      child: Buttons(
                        orientation: Orientation.landscape,
                        controller2: controller,
                        color2: ColorApp.pink, //
                        color: ColorApp.pink,
                        controller: controller, //
                        onTapDown2: (_) {
                          controller.forward().whenComplete(() {
                            tap1 = true;
                            towerBoxProvider.tapPinks(level++, context);
                            print('tap1' + tap1.toString());
                            towerBoxProvider.tapAll(tap1, tap2, 0, context);
                            print('dddddddddddddddddd---------' +
                                level.toString());
                            controller.reset();
                          });
                        },
                        onTapUp2: (_) {
                          tap1 = false;
                          print('tap1' + tap1.toString());
                          if (controller.status == AnimationStatus.forward) {
                            controller.reverse();
                          }
                        },
                        onTapDown: (_) {
                          //
                          controller2.forward().whenComplete(() {
                            setState(() {
                              tap2 = true;
                            });
                            towerBoxProvider.tapBlues(level++, context);
                            tap4 = false;
                            print('dddddddddddddddddd---------' +
                                level.toString());
                            towerBoxProvider.tapAll(tap2, tap1, 0, context);
                            print('tap2' + tap2.toString());
                            controller2.reset();
                          });
                        },
                        onTapUp: (_) {
                          //
                          tap2 = false;
                          print('tap2' + tap2.toString());
                          if (controller2.status == AnimationStatus.forward) {
                            controller2.reverse();
                          }
                        },
                      ),
                    ),
                    Container(
                      color: ColorApp.grey,
                      height: size.height,
                      width: size.width * 0.675,
                      child: horizonBox(size, towerBoxProvider, orientation),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.bottomCenter,
                      color: ColorApp.white,
                      height: size.height,
                      width: size.width * 0.1625,
                      child: Buttons(
                        orientation: Orientation.landscape,
                        controller2: controller2, //
                        color2: ColorApp.blue, //
                        color: ColorApp.pink,
                        controller: controller,
                        onTapDown: (_) {
                          controller.forward().whenComplete(() {
                            tap1 = true;
                            towerBoxProvider.tapPinks(level++, context);
                            print('tap1' + tap1.toString());
                            towerBoxProvider.tapAll(tap1, tap2, 0, context);
                            print('dddddddddddddddddd---------' +
                                level.toString());
                            controller.reset();
                          });
                        },
                        onTapUp: (_) {
                          tap1 = false;
                          print('tap1' + tap1.toString());
                          if (controller.status == AnimationStatus.forward) {
                            controller.reverse();
                          }
                        },
                        onTapDown2: (_) {
                          //
                          controller2.forward().whenComplete(() {
                            setState(() {
                              tap2 = true;
                            });
                            towerBoxProvider.tapBlues(level++, context);
                            tap4 = false;
                            print('dddddddddddddddddd---------' +
                                level.toString());
                            towerBoxProvider.tapAll(tap2, tap1, 0, context);
                            print('tap2' + tap2.toString());
                            controller2.reset();
                          });
                        },
                        onTapUp2: (_) {
                          //
                          tap2 = false;
                          print('tap2' + tap2.toString());
                          if (controller2.status == AnimationStatus.forward) {
                            controller2.reverse();
                          }
                        },
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  Widget horizonBox(
    Size size,
    TowerBoxProvider towerBoxProvider,
    Orientation orientation,
  ) {
    return Container(
      width: size.width,
      height: size.height * 0.8375,
      color: ColorApp.grey,
      child: ListView.separated(
          padding: const EdgeInsets.only(bottom: 20),
          reverse: true,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            final item = towerBoxProvider.box[index];
            level = 0;

            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (index == 0)
                  // ignore: avoid_unnecessary_containers
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Transform.rotate(
                      angle: math.pi / 2,
                      // ignore: avoid_unnecessary_containers
                      child: Container(
                        child: CustomPaint(
                            size: const Size(24, 24), painter: DrawTriangle()),
                      ),
                    ),
                  ),
                Align(
                    child: item == 'pink'
                        ? boxs(
                            size, ColorApp.pink, item.toString(), orientation)
                        : item == 'blue'
                            ? boxs(size, ColorApp.blue, item.toString(),
                                orientation)
                            : Transform.rotate(
                                angle: math.pi / 4,
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: ColorApp.purple,
                                          border: Border.all(
                                              color: ColorApp.black)),
                                      width: 100,
                                      height: 100,
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    )
                                  ],
                                ),
                              )),
                if (index == 0)
                  // ignore: avoid_unnecessary_containers
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Transform.rotate(
                      angle: math.pi / -2,
                      // ignore: avoid_unnecessary_containers
                      child: Container(
                        child: CustomPaint(
                            size: const Size(24, 24), painter: DrawTriangle()),
                      ),
                    ),
                  ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
                height: 5,
              ),
          itemCount: towerBoxProvider.box.length),
    );
  }

  Widget boxs(Size size, Color colorApp, String name, Orientation orientation) {
    return Container(
      decoration: BoxDecoration(
          color: colorApp,
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(color: ColorApp.black)),
      width: orientation == Orientation.portrait
          ? size.width * 0.33
          : size.width * 0.20,
      height: orientation == Orientation.portrait
          ? size.height * 0.10
          : size.height * 0.18,
      child: Text(name),
    );
  }
}
