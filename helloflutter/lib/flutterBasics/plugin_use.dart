import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';


///如何使用Flutter包和插件？
class PluginUse extends StatefulWidget {
  const PluginUse({Key? key}) : super(key: key);

  @override
  _PluginUseState createState() => _PluginUseState();
}


class _PluginUseState extends State<PluginUse> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '如何使用Flutter包和插件',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('如何使用Flutter包和插件'),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                },
              child: const Icon(Icons.arrow_back),
            ),
          ),

          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                  Text(
                    '如何使用Flutter包和插件',
                    style: TextStyle(color: ColorUtil.color('#a9ee00')),
                  ),
              ],
            ),
          )
      ),
    );
  }
}