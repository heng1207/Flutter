import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


///http请求
class NetHttp extends StatefulWidget {
  const NetHttp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  _NetHttpState createState() => _NetHttpState();
}

class _NetHttpState extends State<NetHttp> {
  String showResult = '';

  Future<CommonModel> fetchPost() async {
    var url = Uri.parse('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    final response = await http.get(url);
    final result = json.decode(response.body);
    return CommonModel.fromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: (){
            fetchPost().then((CommonModel value) => {
              setState(() {
                showResult = '请求结果: \nhideAppbar:${value.hideAppBar} \nicon: ${value.icon}';
              })
            });
          },
          child: const Text(
              '点我',
              style: TextStyle(fontSize: 26)
          ),
        ),
        Text(showResult)
      ],
    );
  }
}


class CommonModel {
  final String? icon;
  final String? title;
  final String? url;
  final String? statusBarColor;
  final bool? hideAppBar;

  CommonModel({this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppBar: json['hideAppBar'],
    );
  }
}
