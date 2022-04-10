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
  bool tap1 = false, tap2 = false, tapPink = false;
  late Animation<double> animation;
  late AnimationController controller;
  double h = 0.0;
  dynamic kk;
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<TowerBoxProvider>(context, listen: false);
    provider.tower();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons(
                  color: ColorApp.pink,
                  controller: controller,
                  onTapDown: () {
                    controller.forward().whenComplete(() {
                      tap1 = true;
                      towerBoxProvider.tapBlues();
                      controller.reset();
                    });

                    print('mmmmmmmmmmmmmmmmmmmmmmmmmmtap1');
                  },
                  onTapUp: () {
                    if (controller.status == AnimationStatus.forward) {
                      controller.reverse();
                      tap1 = false;
                    }
                  },
                ),
//                 Container(
//                   width: size.width * 0.18,
//                   height: size.height * 0.10,
//                   decoration: BoxDecoration(
//                       color: ColorApp.pink,
//                       shape: BoxShape.circle,
//                       border: Border.all(color: ColorApp.black)),
//                   child: GestureDetector(
//                     onTap: () {
//                       if (towerBoxProvider.box[0] == 'pink') {
//                         tap2 = true;
//                         towerBoxProvider.tapPinks(tap2);
//                       } else {
//                         tap2 = false;
//                       }

//                       if (tap1 == false && tap2 == false) {
//                         // towerBoxProvider.tap();
//                       } else {
//                         print('hhhhhhhhhhhhhhhmmmmmmmmmmm');
//                       }
// //                       Future.delayed(const Duration(seconds: 2), () {
// //                         if (towerBoxProvider.box[0] == 'pink') {
// //                           print(towerBoxProvider.box);
// //                           tapPink = true;
// //                           // towerBoxProvider.onTap();
// //                           towerBoxProvider.box.removeAt(0);
// //                         } else {
// //                           (print('box is blue'));
// //                         }
// //                         //
// //                         //
// // // Here you can write your code

// //                         setState(() {
// //                           // Here you can write your code for open new view
// //                         });
// //                       });
//                       print('mmmmmmmmmmmmmmmmmmmmmmmmmmtap2' + tap2.toString());

//                       //
//                     },

//                     // onTap: () {
//                     // print(towerBoxProvider.box[0]);
//                     // change();

//                     // tapPink == true;
//                     // List b = towerBoxProvider.box.sublist(0);
//                     // print (b);
//                     // setState(() {});

//                     // towerBoxProvider.onTap();
//                     // },
//                     // onTapDown: (details) {
//                     //                       towerBoxProvider.onTap();

//                     // },
//                     // onTapUp: ,
//                   ),
//                 ),
                Container(
                  width: size.width * 0.18,
                  height: size.height * 0.10,
                  decoration: BoxDecoration(
                      color: ColorApp.blue,
                      shape: BoxShape.circle,
                      border: Border.all(color: ColorApp.black)),
                  child: GestureDetector(
                    onTapUp: (_) {
                      tap1 = false;
                      print('mmmmmmmmmmmmmmmmmmmmmmmmmmtap1' + tap1.toString());
                    },
                    onTapDown: (_) {
                      tap1 = true;
                      towerBoxProvider.tapBlues();
                      print('mmmmmmmmmmmmmmmmmmmmmmmmmmtap1' + tap1.toString());
                    },

                    // onTap: () {
                    // if (towerBoxProvider.box[0] == 'blue') {

                    // } else {
                    //   tap1 = false;
                    // }

                    // Future.delayed(const Duration(seconds: 2), () {
                    //   if (towerBoxProvider.box[0] == 'blue') {
                    //     print(towerBoxProvider.box);
                    //     // towerBoxProvider.onTap();
                    //     towerBoxProvider.box.removeAt(0);
                    //   } else {
                    //     (print('box is pink'));
                    //   }
                    //   setState(() {
                    //     // Here you can write your code for open new view
                    //   });
                    // });

                    // print('mmmmmmmmmmmmmmmmmmmmmmmmmmtap1' + tap1.toString());

                    // towerBoxProvider.tap();
                    // },
                  ),
                ),

                // Buttons(color: ColorApp.blue)
              ],
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
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
