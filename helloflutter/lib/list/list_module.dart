import 'package:flutter/material.dart';
import 'package:helloflutter/list/list_vertical.dart';
import 'package:helloflutter/list/list_horizontal.dart';
import 'package:helloflutter/list/expansion_title.dart';
import 'package:helloflutter/list/grid_view.dart';
import 'package:helloflutter/list/list_refresh_load.dart';


class ListModule extends StatefulWidget {
  const ListModule({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  _ListModuleState createState() => _ListModuleState();
}

class _ListModuleState extends State<ListModule> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: '玩转列表组件',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('玩转列表组件'),
          ),

          // body: const ListVertical()
          // body: const ListHorizontal()
          // body: const ExpansionTitle()
          // body:const GridViewDemo()
          body:const ListRefreshLoad()

      ),
    );
  }
}

