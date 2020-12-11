import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  final List navigatorList;
  TabNavigator({Key key, this.navigatorList}) : super(key: key);
  Widget _gridViewItemUi(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print(item);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 60.0,
            height: 60.0,
            child: Image.asset(
              "images/swiper1.png",
              fit: BoxFit.contain,
              height: 30.0,
              width: 30.0,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.pink, //边框颜色
                  style: BorderStyle.solid,
                  width: 1.0, // 边框宽度
                ),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(30.0))),
          ),
          Text("${item["category_name"]}")
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      height: 500.0,
      child: GridView.count(
          physics: const NeverScrollableScrollPhysics(), // 禁止滚动
          crossAxisCount: 4,
          children: navigatorList.map((item) {
            return _gridViewItemUi(context, item);
          }).toList()),
    );
  }
}
