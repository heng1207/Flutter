import 'package:flutter/material.dart';

class HelloWorld extends StatefulWidget {
  const HelloWorld({Key? key}) : super(key: key);
  @override
  _HelloWorldState createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
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
            child: Text(
              'Hello World',
              style: TextStyle(color: Colors.red),
            ),
          )
      ),
    );
  }
}