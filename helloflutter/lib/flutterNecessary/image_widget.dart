import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 必备基础',
      theme: ThemeData.fallback(),
      home: Scaffold(
          body: Column(
            children: <Widget>[
              ///网络图片
              Image.network(
                'http://www.devio.org/img/avatar.png',
              ),

              ///静态图片
              const Image(
                height: 50,
                width: 50,
                image: AssetImage('images/avatar.png'),
              ),
              Image.asset(
                'images/avatar.png',
                width: 26,
                height: 26,
              ),

              ///如何设置placeholder?
              ///从内存中加载placeholder
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'http://www.devio.org/img/avatar.png',
              ),

              ///加载本地资源图片作为placeholder：
              FadeInImage.assetNetwork(
                placeholder: 'images/avatar.png',
                image: 'http://www.devio.org/img/avatar.png',
              ),

              // ///配置图片缓存
              // CachedNetworkImage(
              //   placeholder: (context, url) => CircularProgressIndicator(),
              //   imageUrl:
              //   'https://picsum.photos/250?image=9',
              // ),


              const Icon(Icons.android,size: 100.0),


            ],
          )),
    );
  }
}
