import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/theme.dart';


class CarPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('购物车'),
        ),
        body: Provide<ThemeColor>(builder: (context, child, theme) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Icon(
                  Icons.shopping_cart,
                  size: 50.0,
                  color: Colors.white,
                ),
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(50.0))),
              ),
              Container(
                child: Text('购物车还是空着，快去挑选商品'),
                margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
              ),
              RaisedButton(
                onPressed: () {
                  // Provide.value<ThemeColor>(context)
                  //     .changeTheme(Color.fromRGBO(255, 255, 0, 1));
                  
                },
                child: Provide<ThemeColor>(builder: (context, child, theme) {
                  print("++++++++");
                  return Text(
                    '购物车还是空着，快去挑选商品',
                  );
                }),
                color: Colors.pink,
                textColor: Colors.white,
              ),
            ],
          ));
        }));
  }
}
