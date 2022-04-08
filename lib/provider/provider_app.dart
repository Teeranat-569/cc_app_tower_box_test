// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:math';

import 'package:flutter/material.dart';

class TowerBoxProvider extends ChangeNotifier {
  dynamic booo;
  dynamic cc;
  List<dynamic> box = [];

  tower() {
    List no = ['pink', 'blue'];
    Random random = Random();

    for (var i = 0; i < 9; i++) {
      bool bo = random.nextBool();
      no.shuffle();
      print(no[0]);
      booo = bo;
      // box.add({'color': no[0], 'show' : booo});
      box.add(no[0]);

      print(box);
    }
    box.add('purple');
  }

  onTap() {
    print(box);
  }
}
