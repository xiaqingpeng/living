import 'package:flutter/material.dart';
import 'swiperlist.dart';
import 'textinput.dart';
import 'tabnavigator.dart';
import 'drawer.dart';
import '../../service/http.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List navigatorList = [
    {'name': '甄选生鲜', 'id': 1, 'image': "images/swiper1.png"},
    {'name': '粮油常备', 'id': 2, 'image': "images/swiper2.png"},
    {'name': '饮料乳品', 'id': 3, 'image': "images/swiper3.png"},
    {'name': '休闲食品', 'id': 4, 'image': "images/swiper4.png"},
  ];
  var _items = [];
  @override
  void initState() {
    super.initState();
    getList();
  }

  void getList() {
    HttpController.get(
      "/find_category",
      (data) {
        if (data != null) {
          setState(() {
            _items = json.decode(data)["data"];
          });
        }
      },
    );
  }

  Widget build(BuildContext context) {
    print('请求的数据:${_items}');
    return Scaffold(
        appBar: AppBar(
          title: Text("首页"),
        ),
        drawer: MyDrawer(),
        body: ListView(
          children: <Widget>[
            TextInputList(),
            SwiperList(),
            TabNavigator(navigatorList: _items)
          ],
        ));
  }
}
