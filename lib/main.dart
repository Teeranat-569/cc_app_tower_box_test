// ignore_for_file: avoid_print
import 'dart:math' as math;

import 'package:cc_app_tower_box_test/button.dart';
import 'package:cc_app_tower_box_test/fff.dart';
import 'package:cc_app_tower_box_test/provider/provider_app.dart';
import 'package:cc_app_tower_box_test/style/color_app.dart';
import 'package:flutter/material.dart';
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
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<TowerBoxProvider>(context, listen: false);
    provider.tower();
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
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TowerBoxProvider towerBoxProvider = Provider.of<TowerBoxProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          horizonBox(size, towerBoxProvider),
          Container(
            width: size.width,
            height: size.height * 0.1625,
            color: Colors.white,
            child: Buttons(
              controller2: controller2,
              color2: ColorApp.blue,
              color: ColorApp.pink,
              controller: controller,
              onTapDown: (_) {
                controller.forward().whenComplete(() {
                  tap1 = true;
                  towerBoxProvider.tapPinks(level++);
                  print('mmmmmmmmmmmmmmmmmmmmmmmmmmtap1' + tap1.toString());
                  towerBoxProvider.tapAll(tap1, tap2, level++, context);
                  print('dddddddddddddddddd---------' + level.toString());
                  controller.reset();
                });
              },
              onTapUp: (_) {
                tap1 = false;
                tap3 = true;
                print('mmmmmmmmmmmmmmmmmmmmmmmmmmtap1' + tap1.toString());
                if (controller.status == AnimationStatus.forward) {
                  controller.reverse();
                }
              },
              onTapDown2: (_) {
                controller2.forward().whenComplete(() {
                  setState(() {
                    tap2 = true;
                  });
                  towerBoxProvider.tapBlues(level++);
                  tap4 = false;
                  print('dddddddddddddddddd---------' + level.toString());
                  towerBoxProvider.tapAll(tap2, tap1, level++, context);
                  print('mmmmmmmmmmmmmmmmmmmmmmmmmmtap2' + tap2.toString());
                  controller2.reset();
                });
              },
              onTapUp2: (_) {
                tap2 = false;
                tap3 = true;

                print('mmmmmmmmmmmmmmmmmmmmmmmmmmtap2' + tap2.toString());
                if (controller2.status == AnimationStatus.forward) {
                  controller2.reverse();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget horizonBox(Size size, TowerBoxProvider towerBoxProvider) {
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
            final boxFirst = towerBoxProvider.box;
            print(boxFirst[0].toString());
            return Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (index==0 )
                  // ignore: avoid_unnecessary_containers
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Transform.rotate(angle: math.pi/2,
                      child: Container(
                        child: CustomPaint(
                            size: Size(24, 24), painter: DrawTriangle()),
                      ),
                    ),
                  ),
                Align(
                    child: item == 'pink'
                        ? boxs(size, ColorApp.pink, item.toString())
                        : item == 'blue'
                            ? boxs(size, ColorApp.blue, item.toString())
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
                                      width: 170,
                                      height: 170,
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    )
                                  ],
                                ),
                              )),
                               if (index==0 )
                  // ignore: avoid_unnecessary_containers
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Transform.rotate(
                      angle: math.pi/-2,
                      child: Container(
                        child: CustomPaint(
                            size: Size(24, 24), painter: DrawTriangle()),
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

  Widget boxs(Size size, Color colorApp, String name) {
    return Container(
      decoration: BoxDecoration(
          color: colorApp,
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(color: ColorApp.black)),
      width: size.width * 0.33,
      height: size.height * 0.10,
      child: Text(name),
    );
  }

  Widget ss(var counter) {
    return Text('nnnnnnnnnnnnnnnnnnn' + counter.toString());
  }
}
