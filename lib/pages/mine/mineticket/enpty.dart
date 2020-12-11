import 'package:flutter/material.dart';

class EnptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.payment,
          size: 50.0,
          color: Colors.grey,
        ),
        Container(
          child: Text('你还没有相关的订单'),
          margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
        ),
        Container(
          child: Text('可以看看有哪些新买的'),
          margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
        ),
        RaisedButton(
          onPressed: () => Navigator.of(context).pushNamed('/home_page'),
          child: Text("随便逛逛"),
          color: Colors.pink,
          textColor: Colors.white,
        ),
      ],
    ));
  }
}
