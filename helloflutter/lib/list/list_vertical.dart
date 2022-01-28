import 'package:flutter/material.dart';

const CITY_NAMES = [ '北京', '上海', '广州', '深圳', '杭州', '苏州', '成都', '武汉', '郑州', '洛阳', '厦门', '青岛', '拉萨' ];

///基于ListView实现垂直方式滚动的列表
class ListVertical extends StatelessWidget {
  const ListVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Basic List';

    return ListView(
      children: _buildList(),
    );
  }

  List<Widget> _buildList() {
    return CITY_NAMES.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
