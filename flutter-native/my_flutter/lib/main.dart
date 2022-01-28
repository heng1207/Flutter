import 'package:flutter/material.dart';
import 'package:my_flutter/main_page.dart';
import 'package:my_flutter/channel_page.dart';
import 'package:my_flutter/mine_page.dart';
import 'dart:ui';


@pragma('vm:entry-point')
void main() {
  runApp(const MainApp());
}

@pragma('vm:entry-point')
void channel() {
  // runApp(const ChannelApp());
  runApp(ChannelApp(
    initParams: window.defaultRouteName,
  ));
}

@pragma('vm:entry-point')
void mine() {
  runApp(const MineApp());
}