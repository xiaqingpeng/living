import 'package:flutter/material.dart';

class BindCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _BindCard();
  }
}

class _BindCard extends State<BindCard> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password, telphone, idcard;
  bool check = false;

  void onFinish() {
    var checked = registerFormKey.currentState.validate();
    if (checked) {
      registerFormKey.currentState.save();

      debugPrint("$username");
      debugPrint("$password");
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text('绑定成功...'),
          backgroundColor: Colors.pink,
        )
      );
    }
  }

  String validatorUsername(value) {
    if (value.isEmpty) {
      return '姓名输入不为空';
    }
    return null;
  }

  String validatorIDcard(value) {
    if (value.isEmpty) {
      return '身份证输入不为空';
    }
    return null;
  }

  String validatorTelphone(value) {
    if (value.isEmpty) {
      return '手机号码输入不为空';
    }
    return null;
  }

  String validatorPassword(value) {
    if (value.isEmpty) {
      return '密码输入不为空';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('绑定已有会员卡'),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                        key: registerFormKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "姓名",
                                prefixIcon: Icon(Icons.people),
                                hintText: "请输入姓名",
                              ),
                              validator: validatorUsername,
                              onSaved: (value) => {username = value},
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "身份证",
                                prefixIcon: Icon(Icons.card_giftcard),
                                hintText: "请输入身份证",
                              ),
                              validator: validatorIDcard,
                              onSaved: (value) => {idcard = value},
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "手机号",
                                prefixIcon: Icon(Icons.phone),
                                hintText: "请输入手机号",
                              ),
                              validator: validatorTelphone,
                              onSaved: (value) => {telphone = value},
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "验证码",
                                prefixIcon: Icon(Icons.lock),
                                hintText: "请输入验证码",
                              ),
                              validator: validatorPassword,
                              onSaved: (value) => {password = value},
                            ),
                            CheckboxListTile(
                              value: check,
                              title: Text('开通并遵守百姓量贩会员协议'),
                              activeColor: Colors.pink,
                              onChanged: (bool val) {
                                // val 是布尔值
                                setState(() {
                                  check = val;
                                });
                              },
                            ),
                            SizedBox(
                              height: 32.0,
                            ),
                            Container(
                              width: double.infinity,
                              child: RaisedButton(
                                onPressed: () => {onFinish()},
                                color: Theme.of(context).accentColor,
                                elevation: 0.0,
                                child: Text(
                                  '绑定百姓量贩会员卡',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ))
                  ],
                ))));
  }
}
