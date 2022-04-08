// ignore_for_file: avoid_print

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

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<TowerBoxProvider>(context, listen: false);
    provider.tower();
  }

  dynamic kk;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TowerBoxProvider towerBoxProvider = Provider.of<TowerBoxProvider>(context);
    // kk = towerBoxProvider.tower();
    print(kk);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: size.width,
            height: size.height * 0.8375,
            color: ColorApp.grey,
            child: ListView.separated(
                reverse: true,
                itemBuilder: (_, index) {
                  final item = towerBoxProvider.box[index];
                  print(item);
                  print(size.width * 0.30);
                  print(size.height);
                  return Align(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: item == 'pink'
                              ? boxs(size, ColorApp.pink)
                              : boxs(size, ColorApp.blue)));
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      height: 4,
                    ),
                itemCount: towerBoxProvider.box.length),
          ),
          Container(
            width: size.width,
            height: size.height * 0.1625,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons(
                  color: ColorApp.pink,
                ),
                Buttons(
                  color: ColorApp.blue,
                ),
              ],
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget boxs(Size size, Color colorApp) {
    return Container(
      decoration: BoxDecoration(
          color: colorApp,
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          // shape: BoxShape.circle,
          border: Border.all(color: ColorApp.black)),

      width: size.width * 0.33,
      height: size.height * 0.10,
      // color: colorApp,
    );
  }
}
