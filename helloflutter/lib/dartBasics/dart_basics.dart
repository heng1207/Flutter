import 'package:flutter/material.dart';
import 'package:helloflutter/dartBasics/data_type.dart';
import 'package:helloflutter/dartBasics/oop_learn.dart';
import 'package:helloflutter/dartBasics/function_learn.dart';
import 'package:helloflutter/dartBasics/generic_learn.dart';


class DartBasics extends StatefulWidget {
  const DartBasics({Key? key}) : super(key: key);

  @override
  _DartBasicsState createState() => _DartBasicsState();
}

class _DartBasicsState extends State<DartBasics> {
  @override
  Widget build(BuildContext context) {

    _oopLearn();
    // _functionLearn();
    // _genericLearn();

    return MaterialApp(
        title: 'Flutter必备Dart基础',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter必备Dart基础"),
          ),
          body: Center(
            child: ListView(
              children: const <Widget>[
                // DataType(),

              ],
            ),
          ),
        ),
    );
  }
}

void _oopLearn() {
  //创建Student的对象
  Student stu1 = Student('清华', 'Jack', 18);
  stu1.school = '985';
  print(stu1.toString());

  Student stu2 = Student('北大', 'Tom', 16, city: '上海', country: '中国');
  print(stu2.toString());

  ///静态方法调用
  Student.doPrint('_oopLearn');

  ///抽象类
  StudyFlutter sf = StudyFlutter();
  sf.study();

  Logger log1 = Logger();
  Logger log2 = Logger();
  print(log1 == log2);

}

void _functionLearn() {
  TestFunction testFunction = TestFunction();
  testFunction.start();
}

void _genericLearn() {
  TestGeneric testGeneric = TestGeneric();
  testGeneric.start();
}
