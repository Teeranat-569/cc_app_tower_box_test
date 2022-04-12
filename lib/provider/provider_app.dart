// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class TowerBoxProvider extends ChangeNotifier {
  dynamic booo;
  dynamic cc;
  List<dynamic> box = [];
  List<int> timea = [];
  List<int> oo = [];
  List<int> pp = [];

  late Timer timer;
  late int index;
  late String name;
  late bool tapPink;
  late bool tapBlue;
  var counter = 0;

  // late bool tabPinka, tabBluea;

  tower() {
    List no = ['pink', 'blue'];
    Random random = Random();

    for (var i = 0; i < 9; i++) {
      bool bo = random.nextBool();
      no.shuffle();
      booo = bo;
      // box.add({'color': no[0], 'show' : booo});
      box.add(no[0]);
      print(box[i]);
    }
    box.add('purple');
    print(box);
    // print(box.first);
    for (var i = 0; i < box.length; i++) {
      print(',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,');
      print(box[i]);
    }
  }

  tapBlues(int level) {
    print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv2222222---' +
        level.toString());
    if (box[0] == 'blue') {
      // print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
      // print(box.first);
      print('mmmmmmmmmmmmmmmmmmm');

      box.removeAt(0);
      print(box);

      if (level == 0) {
        timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          print(timer.tick);
          counter++;
        });
      }

      // level++;
      if (level == 1) {
        print('22222222222222222222');
      }
      // level++;
    } else {
      (print('box is pink'));
    }

    notifyListeners();
  }

  tapPinks(int level) {
    print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv111111---' +
        level.toString());
    if (box[0] == 'pink') {
      print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
      box.removeAt(0);
      print(box);
      if (level == 0) {
        timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          print(timer.tick);
          counter++;
        });
      }
      if (level == 1) {
        print('ggggggggggggggggggggggg');
      }

      // level++;
    } else {
      (print('box is blue'));
      // level--;
    }
    // level++;

    notifyListeners();
    // });
  }

  tapAll(bool tapPinka, bool tapBluea, int level, BuildContext context) {
    if (box[0] == 'purple') {
      if (tapPinka && tapBluea) {
        box.removeAt(0);
        print(box);
        (print('Yessssssssssssssssss////'));
        (print('Yesssssssssssssnnnn--******sssss////'));
        print(timea);
        timer.cancel();
        print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa' + counter.toString());
        _showMyDialog(context, counter.toString());
      }
    } else {
      (print('Nooooooooooooo3333333'));
    }

    notifyListeners();
  }

  Future<void> _showMyDialog(BuildContext context, String text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is Time ${text}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
                tower();
              },
            ),
          ],
        );
      },
    );
  }
}
