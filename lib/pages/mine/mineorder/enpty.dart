import 'package:flutter/material.dart';

class EnptyPage extends StatelessWidget {
  int id;
  String name;
  String mark;
  EnptyPage({Key key, this.name, this.id, this.mark}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mark == 'order'
          ? AppBar(
              title: Text('$name'),
            )
          : null,
      body: Center(
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
      )),
    );
  }
}
