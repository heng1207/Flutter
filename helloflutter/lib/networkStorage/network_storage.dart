import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:helloflutter/networkStorage/network.dart';
import 'package:helloflutter/networkStorage/future.dart';
import 'package:helloflutter/networkStorage/future_builder.dart';
import 'package:helloflutter/networkStorage/preferences.dart';


class NetworkStorage extends StatefulWidget {
  const NetworkStorage({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  _NetworkStorageState createState() => _NetworkStorageState();
}

class _NetworkStorageState extends State<NetworkStorage> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: '网络编程与数据存储技术',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('网络编程与数据存储技术'),
          ),

          body: const NetHttp()
          // body: const FultureUser()
          // body: const FuturerBuilder()
          // body:const CounterWidget()

      ),
    );
  }
}

