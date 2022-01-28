import 'package:flutter/material.dart';

class MineApp extends StatelessWidget {
  const MineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "我的模块",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Color(0xFFD63031),//ARGB 红色
      body: Center(
        child: Text(
          '我的', // 显示的文字
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}