import 'package:flutter/material.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

class MyDrawer extends StatefulWidget {
  int id;
  String name;
  MyDrawer({Key key, this.name, this.id}) : super(key: key);
  @override
  _MyDrawer createState() => new _MyDrawer();
}

class _MyDrawer extends State<MyDrawer> {
  final JPush jpush = new JPush();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.pink,
                child: Row(
                  children: <Widget>[
                    ClipOval(
                      child: Image.network(
                        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3024387196,1621670548&fm=27&gp=0.jpg",
                        width: 80.0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 50.0),
                      child: Text(
                        "夏庆鹏",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.pink,
                      ),
                      title: Text("个人信息"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        IconData(0xe6ae, fontFamily: 'iconfont'),
                        color: Colors.pink,
                      ),
                      title: Text("我的相册"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        IconData(0xe6a8, fontFamily: 'iconfont'),
                        color: Colors.pink,
                      ),
                      title: Text("公告消息"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Colors.pink,
                      ),
                      title: Text("设置"),
                      onTap: () {
                        jpush.openSettingsForNotification();
                      },
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
