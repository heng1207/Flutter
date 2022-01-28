import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChannelApp extends StatelessWidget {
  final String initParams;
  const ChannelApp({required this.initParams, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "通道模块",
      theme: ThemeData(primarySwatch: Colors.blue),
      home:  MainPage (initParams: initParams),
    );
  }
}

class MainPage extends StatefulWidget {
  final String initParams;
  const MainPage({required this.initParams, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  //注意这里的com.flutterToNative一定要与原生的名称相同，不然没办法通信
  static const methodChannel = MethodChannel('com.flutterToNative');
  static const BasicMessageChannel _basicMessageChannel =  BasicMessageChannel('BasicMessageChannelPlugin', StringCodec());
  static const EventChannel _eventChannelPlugin = EventChannel('EventChannelPlugin');
  late StreamSubscription _streamSubscription;

  String showMessage = "";


  @override
  void initState() {
    _basicMessageChannel.setMessageHandler((message) =>  Future<String>((){
         setState(() {
           showMessage = 'BasicMessageChannel:'+message;
         });
         return "收到Native的消息：" + message;
    }));

    _streamSubscription=_eventChannelPlugin
        .receiveBroadcastStream()
        .listen(_onToDart, onError: _onToDartError);

    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);

    return Scaffold(
      backgroundColor: const Color(0xFFD63031),//ARGB 红色
      body:Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        margin: EdgeInsets.only(top: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '收到初始参数initParams:${widget.initParams}',
              style: textStyle,
            ),
            Text(
              'Native传来的数据：' + showMessage,
              style: textStyle,
            ),
            TextField(
              onChanged: _onTextChange,
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
            ),
          ],
        ),
      ),
    );
  }


  void _onTextChange(value) async {
    String response;
    try {
      response = await _basicMessageChannel.send(value);
    } on PlatformException catch (e) {
      print(e);
    }
  }


  void _onToDart(message) {
    setState(() {
      showMessage = message;
    });
  }

  void _onToDartError(error) {
    print(error);
  }


}
