// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class TowerBoxProvider extends ChangeNotifier {
  dynamic booo;
  dynamic cc;
  List<dynamic> box = [];
  late Timer timer;
  late int index;
  late String name;
  late bool tapPink;
  late bool tapBlue;
  // late bool tabPinka, tabBluea;

  tower() {
    List no = ['pink', 'blue'];
    Random random = Random();

    for (var i = 0; i < 9; i++) {
      bool bo = random.nextBool();
      no.shuffle();
      // print(no[0]);
      booo = bo;
      // box.add({'color': no[0], 'show' : booo});
      box.add(no[0]);

      // print(box);
    }
    box.add('purple');
  }

  void onTap() {
    // print(box);
    var counter = 0;
    Timer.periodic(const Duration(seconds: 2), (timer) {
      print(timer.tick);
      counter++;
      // ignore: prefer_is_empty
      if (box.length == 0) {
        print('Cancel timer');
    print('hghhhhhhhhhhhhhhhhhhhhhhhtptal           ' + counter.toString());
        timer.cancel();
      }
    });
  }

  tapBlues() {
    // Future.delayed(const Duration(seconds: 2), () {
    // tapBlue = true;
    // print('mmmmmmmmmmmmmmmmmmmmmmmmmmtap1' + tapBlue.toString());

    if (box[0] == 'blue') {
      print(box);
      // towerBoxProvider.onTap();
      box.removeAt(0);
    } else {
      (print('box is pink'));
    }
    notifyListeners();
    // });
  }

  tapPinks() {
    // tapPink = true;
    // print('mmmmmmmmmmmmmmmmmmmmmmmmmmtap1' + tapPink.toString());
    // Future.delayed(const Duration(seconds: 2), () {
    if (box[0] == 'pink') {
      print(box);
      // towerBoxProvider.onTap();
      box.removeAt(0);
    } else {
      (print('box is blue'));
    }
    notifyListeners();
    // });
  }

  tap(bool tapPinka,bool tapBluea) {
    // Future.delayed(const Duration(seconds: 2), () {
      
      if (box[0] == 'purple') {
        if (tapPinka && tapBluea) {
          box.removeAt(0);
          print(box);
                  (print('Yessssssssssssssssss'));

        }
        // else {
        //   (print('Nooooooooooooo'));
        // }
      } else {
        (print('Nooooooooooooo3333333'));
      }

      notifyListeners();
    // });
  }

  // notifyListeners();
}
