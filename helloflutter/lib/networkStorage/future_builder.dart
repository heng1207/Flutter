import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class FuturerBuilder extends StatefulWidget {
  const FuturerBuilder({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FuturerBuilderState();
}

class _FuturerBuilderState extends State<FuturerBuilder> {
  String showResult = '';

  Future<CommonModel> fetchPost() async {
    var url = Uri.parse('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    final response = await http.get(url);
    Utf8Decoder utf8decoder = const Utf8Decoder(); //fix 中文乱码
    var result = json.decode(utf8decoder.convert(response.bodyBytes));
    return CommonModel.fromJson(result);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  FutureBuilder<CommonModel>(
        future: fetchPost(),
        builder:
            (BuildContext context, AsyncSnapshot<CommonModel> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('Input a URL to start');
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              return const Text('');
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text(
                  '${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                );
              } else {
                return Column(children: <Widget>[
                  Text('icon:${snapshot.data?.icon}'),
                  Text('statusBarColor:${snapshot.data?.statusBarColor}'),
                  Text('title:${snapshot.data?.title}'),
                  Text('url:${snapshot.data?.url}')
                ]);
              }
          }
        });
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
