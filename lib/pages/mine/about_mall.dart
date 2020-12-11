// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// class AboutMallPage extends StatelessWidget {
//   int id;
//   String name;
//   AboutMallPage({Key key, this.name,this.id}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//          title: Text('$name'),
//       ),
//       body: WebView(
//         initialUrl: "https://www.taobao.com/",
//         javascriptMode: JavascriptMode.unrestricted,
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'dart:convert';

// class MineAddressPage extends StatelessWidget {
//   int id;
//   String name;
//   MineAddressPage({Key key, this.name,this.id}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$name'),
//       ),
//       body: Center(
//         child: Text('$name'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

class AboutMallPage extends StatefulWidget {
  int id;
  String name;
  AboutMallPage({Key key, this.name, this.id}) : super(key: key);
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<AboutMallPage> {
  String debugLable = 'Unknown';
  final JPush jpush = new JPush();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;

    try {
      jpush.addEventHandler(
          onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotification1: $message");
        setState(() {
          debugLable = "flutter onReceiveNotification1: $message";
        });
      }, onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification2: $message");
        setState(() {
          debugLable = "flutter onOpenNotification: $message";
        });
      }, onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage3: $message");
        setState(() {
          debugLable = "flutter onReceiveMessage4: $message";
        });
      }, onReceiveNotificationAuthorization:
              (Map<String, dynamic> message) async {
        print("flutter onReceiveNotificationAuthorization5: $message");
        setState(() {
          debugLable = "flutter onReceiveNotificationAuthorization6: $message";
        });
      });
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    jpush.setup(
      appKey: "8ef34d2532e675b2c98d9806", //你自己应用的 AppKey
      channel: "theChannel",
      production: false,
      debug: true,
    );
    jpush.applyPushAuthority(
        new NotificationSettingsIOS(sound: true, alert: true, badge: true));
    jpush.getRegistrationID().then((rid) {
      print("flutter get registration id : $rid");
      setState(() {
        debugLable = "flutter getRegistrationID: $rid";
      });
    });

    if (!mounted) return;

    setState(() {
      debugLable = platformVersion;
    });
  }

// 编写视图
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('极光推送'),
        ),
        body: new Center(
            child: new Column(children: [
          new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                    child: new Text("发本地推送"),
                    onPressed: () {
                      // 1秒后出发本地推送
                      var fireDate = DateTime.fromMillisecondsSinceEpoch(
                          DateTime.now().millisecondsSinceEpoch + 1000);
                      var localNotification = LocalNotification(
                          id: 234,
                          title: '百姓生活+',
                          buildId: 1,
                          content: '尊敬的用户，欢迎使用欢迎使用百姓生活+App，首单立减30，快来下单吧',
                          fireTime: fireDate,
                          subtitle: '全场8折',
                          badge: 5,
                          extra: {"fa": "0"});
                      jpush
                          .sendLocalNotification(localNotification)
                          .then((res) {
                        setState(() {
                          debugLable = res;
                        });
                      });
                    }),
              ]),
        ])),
      ),
    );
  }
}
