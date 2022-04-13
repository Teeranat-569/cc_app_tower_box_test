// ignore_for_file: avoid_print
import 'dart:math' as math;

import 'package:cc_app_tower_box_test/button.dart';
import 'package:cc_app_tower_box_test/home.dart';
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

