import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

///基于shared_preferences本地存储操作
class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<CounterWidget> {
  String countString = '';
  String localCount = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Increment Counter')
          ),
          ElevatedButton(onPressed: _getCounter,
              child: const Text('Get Counter')
          ),
          Text(
            countString,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            'result：' + localCount,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      countString = countString + " 1";
    });
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    await prefs.setInt('counter', counter);
  }

  _getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      localCount = prefs.getInt('counter').toString();
    });
  }
}