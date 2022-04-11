// ignore_for_file: avoid_print
import 'dart:math' as math;

import 'package:cc_app_tower_box_test/button.dart';
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
  bool tap1 = false, tap2 = false, tapPink = false, tap3 = false;
  late Animation<double> animation, animation2;
  late AnimationController controller, controller2;
  double h = 0.0;
  dynamic kk;
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
        // print('$status');
      });

    animation = Tween<double>(end: 0).animate(controller)
      ..addListener(() {
        setState(() {});
        // print('$status');
      });
    //  controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TowerBoxProvider towerBoxProvider = Provider.of<TowerBoxProvider>(context);
    kk = towerBoxProvider.box;
    // print(kk);
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
                // towerBoxProvider.onTap();
                controller.forward().whenComplete(() {
                  tap1 = true;
                  // tap3 = true;

                  towerBoxProvider.tapPinks();
                  // towerBoxProvider.tap(tap1, tap2);
                  print('mmmmmmmmmmmmmmmmmmmmmmmmmmtap1' + tap1.toString());
                  // print('mmmmmmmmmmmmmmmmm--------mmmmmmmmmtap2' +
                  //     tap3.toString());

                  towerBoxProvider.tap(tap1, tap2);
                  controller.reset();
                });
              },
              onTapUp: (_) {
                tap1 = false;
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
                  // towerBoxProvider.tap(tap1, tap2);

                  towerBoxProvider.tapBlues();
                  // towerBoxProvider.tap(tap1, tap2);
                  print('mmmmmmmmmmmmmmmmmmmmmmmmmmtap2' + tap2.toString());
                  controller2.reset();
                });
              },
              onTapUp2: (_) {
                tap2 = false;
                print('mmmmmmmmmmmmmmmmmmmmmmmmmmtap2' + tap2.toString());
                if (controller2.status == AnimationStatus.forward) {
                  controller2.reverse();
                }
              },
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  tap(bool tapPinka, bool tapBluea, TowerBoxProvider towerBoxProvider) {
    // Future.delayed(const Duration(seconds: 2), () {

    if (towerBoxProvider.box[0] == 'purple') {
      if (tapPinka == tapPinka && tapBluea == tapBluea) {
        towerBoxProvider.box.removeAt(0);
        print(towerBoxProvider.box);
        (print('Yessssssssssssssssss'));
      }
      // else {
      //   (print('Nooooooooooooo'));
      // }
    } else {
      (print('Nooooooooooooo3333333'));
    }

    // notifyListeners();
    // });
  }

  Container horizonBox(Size size, TowerBoxProvider towerBoxProvider) {
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
            // print(item);
            if (towerBoxProvider.box.isEmpty) {
              // ignore: avoid_unnecessary_containers
              return Container(
                child: const Text('data'),
              );
            } else {
              return Align(
                  child: item == 'pink'
                      ? tapPink == true
                          ? Container()
                          : boxs(size, ColorApp.pink, item.toString())
                      : item == 'blue'
                          ? boxs(size, ColorApp.blue, item.toString())
                          : Transform.rotate(
                              angle: math.pi / 4,
                              alignment: Alignment.center,
                              child: Container(
                                width: 164.71,
                                height: 164.71,
                                color: ColorApp.purple,
                              ),
                            ));
            }
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
          // shape: BoxShape.circle,
          border: Border.all(color: ColorApp.black)),

      width: size.width * 0.33,
      height: size.height * 0.10,
      // color: colorApp,
      child: Text(name),
    );
  }
}

// ignore: camel_case_types
