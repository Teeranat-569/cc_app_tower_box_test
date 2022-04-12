// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:async';
import 'dart:math';
import 'package:async/async.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TowerBoxProvider extends ChangeNotifier {
  dynamic booo;
  dynamic cc;
  List<dynamic> box = [];
  List<int> timea = [];
  List<int> oo = [];
  List<int> pp = [];
  late int level = 0;

  late Timer timer;
  late int index;
  late String name;
  late bool tapPink;
  late bool tapBlue;
  var counter = 0;
  final restartableTimer = RestartableTimer(const Duration(seconds: 3), () {
    //Callback
    // print(restartableTimer.tick);
  });

  tower(int level) {
    level = 0;

    List no = ['pink', 'blue'];
    Random random = Random();
    for (var i = 0; i < 9; i++) {
      bool bo = random.nextBool();
      no.shuffle();
      booo = bo;
      box.add(no[0]);
      print(box[i]);
    }
    box.add('purple');
    print(box);
    for (var i = 0; i < box.length; i++) {
      print(',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,');
      print(box[i]);
    }
    restartableTimer.reset();
  }

  tapBlues(int level, BuildContext context) {
    print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv2222222---' +
        level.toString());
    if (box[0] == 'blue') {
      print('This box blue');
      box.removeAt(0);
      print(box);

      if (counter == 0) {
        timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          print(timer.tick);
          counter++;
        });
      }
    } else if (box[0] == 'purple') {
      snackBar(context, 'Box is Purple.');
    } else {
      (print('box is pink'));
      snackBar(context, 'Box is Pink.');
    }

    notifyListeners();
  }

  tapPinks(int level, BuildContext context) {
    print('level---' + level.toString());
    if (box[0] == 'pink') {
      print('This box pink');
      box.removeAt(0);
      print(box);
      if (counter == 0) {
        timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          print(timer.tick);
          counter++;
        });
      }

      // level++;
    } else if (box[0] == 'purple') {
      snackBar(context, 'Box is Purple.');
    } else {
      (print('box is blue'));

      snackBar(context, 'Box is Blue.');
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
        (print('this box purple'));
        (print('Yesssssssssssss////'));
        print(timea);
        timer.cancel();

        print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa' + counter.toString());
        _showMyDialog(context, counter.toString());
      } else {
        Fluttertoast.showToast(
            msg: "กด 2 ปุ่ม\nค้างไว้ 2 วินาที\nเพื่อทำลาย Block สุดท้าย",
            gravity: ToastGravity.CENTER,
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      (print('Nooooooooooooo'));
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
                Text(
                  'Total Time $text s',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Reset'),
              onPressed: () {
                Navigator.of(context).pop(tower(0));
                // tapPinksv(20);
                // timer = Timer(0, _callback);
                resetTime();
                notifyListeners();
              },
            ),
          ],
        );
      },
    );
  }

  snackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
      // action: SnackBarAction(
      //   label: 'Undo',
      //   onPressed: () {},
      // ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    notifyListeners();
  }

  resetTime() {
    // level = 0;
    counter = 0;
  }
}
