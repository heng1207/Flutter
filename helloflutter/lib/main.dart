import 'package:flutter/material.dart';
import 'package:helloflutter/flutterBasics/dynamic_theme.dart';
import 'package:helloflutter/dartBasics/dart_basics.dart';
import 'package:helloflutter/flutterNecessary/image_widget.dart';
import 'package:helloflutter/networkStorage/network_storage.dart';
import 'package:helloflutter/list/list_module.dart';


void main() {
  // runApp(const DartBasics());//Dart基础
  // runApp(const DynamicTheme());//Flutter基础
  // runApp(const ImageWidget());//Flutter必备基础
  // runApp(const NetworkStorage());//网络与数据存储
  runApp(const ListModule());//列表组件
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Welcome to Flutter'),
          ),
          body: const Center(
            // child: Text('Hello World'),
            child: Text('Hello World',
              style: TextStyle(color: Colors.red),
            ),
          )
      ),
    );
  }
}