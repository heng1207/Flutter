import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';


class FultureUser extends StatelessWidget {
  const FultureUser({Key? key}) : super(key: key);

  Future<String> testFuture() {
//   throw new Error();
    return Future.value('success');
//   return Future.error('error');
  }

  main() {
    testFuture().then((s) {
      print(s);
    }, onError: (e) {
      print('onError:');
      print(e);
    }).catchError((e) {
      print('catchError:');
      print(e);
    });
  }



  test() async {
    int result = await Future.delayed(const Duration(milliseconds: 2000), () {
      return Future.value(123);
    });
    print('t3:' + DateTime.now().toString());
    print(result);
  }

  main2() {
    print('t1:' + DateTime.now().toString());
    test();
    print('t2:' + DateTime.now().toString());
  }


  main3() {
    var random = Random();
    Future.delayed(const Duration(seconds: 3), () {
      if (random.nextBool()) {
        return 100;
      } else {
        throw 'boom!';
      }
    }).then(print).catchError(print).whenComplete(() {
      print('done!');
    });
  }


  main4() {
    Future.delayed(const Duration(seconds: 3), () {
      return 1;
    }).timeout(const Duration(seconds: 2)).then(print).catchError(print);
  }

  @override
  Widget build(BuildContext context) {
    // main();
    // main2();
    // main3();
    main4();
    return const Text('Future的使用，请看控制台输出');
  }

}