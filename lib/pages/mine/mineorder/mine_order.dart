import 'package:flutter/material.dart';
import './allgoods.dart';
import './unpayment.dart';
import './undelivery.dart';
import './ungoods.dart';
import './unevaluate.dart';
class MineOrderPage extends StatefulWidget {
  String title;
  int id;
  MineOrderPage({this.title, this.id});

  @override
  _Home2State createState() => _Home2State(title2: this.title);
}

class _Home2State extends State<MineOrderPage> {
  String title2;
  _Home2State({this.title2 = 'hh'});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, //配置顶部tab的数量
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.title2),
          //配置顶部导航栏
          bottom: TabBar(
            labelColor: Colors.white,
            isScrollable: true,
            labelStyle: TextStyle(fontSize: 14),
            tabs: <Widget>[
              Tab(text: "全部"),
              Tab(text: "待付款"),
              Tab(text: "待发货"),
              Tab(text: "待收货"),
              Tab(text: "待评价")
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            AllGoodsPage(),
            UnPaymentPage(),
            UnDeliveryPage(),
            UnGoodsPage(),
            UnEvaluatePage()
          ],
        ),
      ),
    );
  }
}








