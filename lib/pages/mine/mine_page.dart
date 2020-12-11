import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import './mine_detail.dart';
import 'mineservice/mine_service.dart';
import 'mineorder/mine_order.dart';
import 'mineticket/mine_ticket.dart';
import './income_detail.dart';
import './qrcode_page.dart';
import './about_mall.dart';
import './mine_scan.dart';
import './mine_address.dart';
import './vipcard/bind_card.dart';
import './vipcard/open_card.dart';
import 'mineorder/unpayment.dart';
import 'mineorder/undelivery.dart';
import 'mineorder/ungoods.dart';
import 'mineorder/unevaluate.dart';

class MinePage extends StatelessWidget {
  final routes = {
    '/mine_detail': (BuildContext context) => new MineDetailPage(),
    '/mine_service': (BuildContext context) => new MineServicePage(),
    '/mine_order': (_) => new MineOrderPage(),
    '/mine_address': (_) => new MineAddressPage(),
    '/mine_scan': (_) => new MineScanPage(),
    '/mine_ticket': (_) => new MineTicketPage(),
    '/income_detail': (_) => new IncomeDetailPage(),
    '/qrcode_page': (_) => new QrcodePage(),
    '/about_mall': (_) => new AboutMallPage(),
    '/bind_card': (_) => new BindCard(),
    '/open_card': (_) => new OpenCard(),
    '/evaluate_page': (BuildContext context) => new UnEvaluatePage(),
    '/goods_page': (BuildContext context) => new UnGoodsPage(),
    '/payment_page': (BuildContext context) => new UnPaymentPage(),
    '/delivery_page': (BuildContext context) => new UnDeliveryPage(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 去除debugger
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('我的'),
            centerTitle: false,
            actions: <Widget>[
              IconButton(
                  icon: new Icon(
                    IconData(0xe7d4, fontFamily: 'iconfont'),
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    print('history....');
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                      return MineScanPage();
                    }));
                    ;
                  }),
            ],
          ),
          body: ListView(
            children: <Widget>[
              HeaderPage(),
              ButtonPage(),
              TabNavigator(),
              TabList()
            ],
          )),
      routes: routes,
    );
  }
}

class HeaderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImagePickerState();
  }
}

class _ImagePickerState extends State<HeaderPage> {
  var _imgPath;
  /*拍照*/
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _imgPath = image;
    });
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 200.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.cyanAccent[100],
            Colors.purple[100],
            Colors.cyanAccent[100],
          ],
        ),
      ),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new Container(
                  width: 100.0,
                  height: 100.0,
                  // margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    child: _imgPath == null
                        ? Image.asset(
                            "images/swiper1.png",
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            _imgPath,
                            fit: BoxFit.cover,
                            width: 150,
                            height: 150,
                          ),
                    onTap: () => {_openGallery()},
                  ),
                  decoration: BoxDecoration(
                      // color: Colors.cyanAccent,

                      border: Border.all(
                        color: Colors.white, //边框颜色
                        style: BorderStyle.solid,
                        width: 2.0, // 边框宽度
                      ),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(50.0))),
                ),
                new GestureDetector(
                  onTap: () => {
                    showDialog(
                        // 传入 context
                        context: context,
                        barrierDismissible: false,
                        // 构建 Dialog 的视图
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('我的登录'),
                            content: Text('你确定登录吗？'),
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('取消')),
                              FlatButton(
                                  onPressed: () {
                                    Fluttertoast.showToast(
                                        msg: "登录成功",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.pink,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    Navigator.pop(context);
                                  },
                                  child: Text('确定'))
                            ],
                          );
                        })
                  },
                  child: new Text(
                    '夏庆鹏',
                    style: new TextStyle(
                        // color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                onPressed: () => {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return BindCard();
                  }))
                },
                child: Text('绑定已有会员卡'),
                color: Colors.pink,
                textColor: Colors.white,
              ),
              RaisedButton(
                onPressed: () => {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return OpenCard();
                  }))
                },
                child: Text('开通新的会员卡'),
                color: Colors.orange,
                textColor: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TabNavigator extends StatelessWidget {
  final List navigatorList = [
    {'name': '待付款', 'id': 1, 'icon': 0xe60f},
    {'name': '待发货', 'id': 2, 'icon': 0xe656},
    {'name': '待收货', 'id': 3, 'icon': 0xe624},
    {'name': '待评价', 'id': 4, 'icon': 0xe606},
  ];

  Widget _gridViewItemUi(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print(item);
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) {
              if (item['name'] == '待付款') {
                return UnPaymentPage(
                    name: item['name'], id: item['id'], mark: 'order');
              } else if (item['name'] == '待发货') {
                return UnDeliveryPage(
                    name: item['name'], id: item['id'], mark: 'order');
              } else if (item['name'] == '待收货') {
                return UnGoodsPage(
                    name: item['name'], id: item['id'], mark: 'order');
              } else if (item['name'] == '待评价') {
                return UnEvaluatePage(
                    name: item['name'], id: item['id'], mark: 'order');
              } else {
                print('888');
              }
            },
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            IconData(item['icon'], fontFamily: 'iconfont'),
            color: Colors.black54,
          ),
          Text(
            item['name'],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      // margin: const EdgeInsets.only(bottom: 20.0),
      child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          children: navigatorList.map((item) {
            return _gridViewItemUi(context, item);
          }).toList()),
    );
  }
}

class TabList extends StatelessWidget {
  final List navigatorList = [
    {'name': '我的订单', 'id': 1, 'icon': 0xe620},
    {'name': '我的优惠券', 'id': 2, 'icon': 0xe60c},
    {'name': '地址管理', 'id': 4, 'icon': 0xe622},
    {'name': '关于商城', 'id': 5, 'icon': 0xe607},
    {'name': '扫码进行投诉', 'id': 6, 'icon': 0xe7d4},
    {'name': '分享收入明细', 'id': 7, 'icon': 0xe610},
    {'name': '售后服务', 'id': 8, 'icon': 0xe67f},
  ];

  Widget _listViewItemUi(BuildContext context, item) {
    return Column(children: <Widget>[
      Divider(
        height: 2.0,
        indent: 0.0,
        color: Colors.grey,
      ),
      ListTile(
        title: new Text(item["name"],
            style: new TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            )),
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (BuildContext context) {
                if (item['name'] == '售后服务') {
                  return MineServicePage(name: item['name'], id: item['id']);
                } else if (item['name'] == '我的订单') {
                  return MineOrderPage(title: item['name'], id: item['id']);
                } else if (item['name'] == '扫码进行投诉') {
                  return QrcodePage(name: item['name'], id: item['id']);
                } else if (item['name'] == '分享收入明细') {
                  return IncomeDetailPage(name: item['name'], id: item['id']);
                } else if (item['name'] == '我的优惠券') {
                  return MineTicketPage(name: item['name'], id: item['id']);
                } else if (item['name'] == '我的地址') {
                  return MineAddressPage(name: item['name'], id: item['id']);
                } else if (item['name'] == '关于商城') {
                  return AboutMallPage(name: item['name'], id: item['id']);
                } else {
                  return MineDetailPage(name: item['name'], id: item['id']);
                }
              },
            ),
          );
          // Navigator.of(context).pushNamed('/mine_detail',arguments: item);
        },
        leading: new Icon(
          // item["icon"],
          IconData(item['icon'], fontFamily: 'iconfont'),
          color: Colors.black54,
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: navigatorList.map((item) {
      return _listViewItemUi(context, item);
    }).toList());
  }
}
