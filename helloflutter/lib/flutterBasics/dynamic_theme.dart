import 'package:flutter/material.dart';
import 'package:helloflutter/flutterBasics/hello_world.dart';
import 'package:helloflutter/flutterBasics/plugin_use.dart';
import 'package:helloflutter/flutterBasics/less_group_page.dart';
import 'package:helloflutter/flutterBasics/statefull_group_page.dart';
import 'package:helloflutter/flutterBasics/flutter_layout_page.dart';
import 'package:helloflutter/flutterBasics/gesture_page.dart';
import 'package:helloflutter/flutterBasics/res_page.dart';
import 'package:helloflutter/flutterBasics/flutter_widget_lifecycle.dart';
import 'package:helloflutter/flutterBasics/app_lifecycle.dart';



class DynamicTheme extends StatefulWidget {
  const DynamicTheme({Key? key}) : super(key: key);
  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  Brightness _brightness = Brightness.light;
  ///字体下载地址：https://fonts.google.com/specimen/Rubik+Mono+One?selection.family=Rubik+Mono+One
  ///更多参考：https://flutter.dev/docs/cookbook/design/fonts
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
//          fontFamily: 'RubikMonoOne',//将该字体应用到全局
          brightness:_brightness,
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('如何创建和使用Flutter的路由与导航？'),
          ),
          body: Column(
            children: <Widget>[
              ElevatedButton (
                onPressed: () {
                  setState(() {
                    if (_brightness == Brightness.dark) {
                      _brightness = Brightness.light;
                    } else {
                      _brightness = Brightness.dark;
                    }
                  });
                },
                child: const Text('切换主题abc',style: TextStyle(fontFamily: 'RubikMonoOne'),),
              ),
              const RouteNavigator()
            ],
          ),
        ),
        routes: <String, WidgetBuilder>{
          'plugin': (BuildContext context) => const PluginUse(),
          'less': (BuildContext context) => const LessGroupPage(),
          'ful': (BuildContext context) => const StatefulGroup(),
          'layout': (BuildContext context) => const FlutterLayoutPage(),
          'gesture': (BuildContext context) => const GesturePage(),
          'res': (BuildContext context) => const ResPage(),
          // 'launch': (BuildContext context) => LaunchPage(),
          'widgetLifecycle': (BuildContext context) => const WidgetLifecycle(),
          'appLifecycle': (BuildContext context) => const AppLifecycle(),
          // 'photo': (BuildContext context) => PhotoApp(),
        });
  }
}

class RouteNavigator extends StatefulWidget {
  const RouteNavigator({Key? key}) : super(key: key);
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SwitchListTile(
            title:Text('${byName ? '' : '不'}通过路由名跳转'),
            value: byName,
            onChanged: (value) {
              setState(() {
                byName = value;
              });
            }),
        _item('如何使用Flutter包和插件？', const PluginUse(), 'plugin'),
        _item('StatelessWidget与基础组件', const LessGroupPage(), 'less'),
        _item('StatefulWidget与基组件', const StatefulGroup(), 'ful'),
        _item('如何进行Flutter布局开发', const FlutterLayoutPage(), 'layout'),
        _item('如何检测用户手势以及处理点击事件？', const GesturePage(), 'gesture'),
        _item('如何导入和使用Flutter的资源文件？', const ResPage(), 'res'),
        // _item('如何打开第三方应用？', LaunchPage(), 'launch'),
        _item('Flutter页面生命周期', const WidgetLifecycle(), 'widgetLifecycle'),
        _item('Flutter应用生命周期', const AppLifecycle(), 'appLifecycle'),
        // _item('【实战尝鲜】拍照APP开发', PhotoApp(), 'photo'),
      ],
    );
  }

  _item(String title, page, String routeName) {
    return ElevatedButton (
      onPressed: () {
        if (byName) {
          Navigator.pushNamed(context, routeName);
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        }
      },
      child: Text(title),
    );
  }
}
