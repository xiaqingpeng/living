import 'package:flutter/material.dart';
import './enpty.dart';

class UnGoodsPage extends StatefulWidget {
  int id;
  String name;
  String mark;
  UnGoodsPage({Key key, this.id, this.mark, this.name}) : super(key: key);

  @override
  _UnGoodsPage createState() =>
      _UnGoodsPage(id: this.id, name: this.name, mark: this.mark);
}

class _UnGoodsPage extends State<UnGoodsPage> {
  int id;
  int _currentStep = 2;
  String name;
  String mark;
  _UnGoodsPage({Key key, this.name, this.id, this.mark});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name'),
      ),
      body: Center(
        child: Column(
          children: [
            Stepper(
              onStepTapped: (int currentStep) {
                setState(() {
                  _currentStep = currentStep;
                });
              },
              currentStep: _currentStep,
              onStepContinue: () {
                setState(() {
                  _currentStep < 2 ? _currentStep += 1 : _currentStep = 2;
                });
              },
              onStepCancel: () {
                setState(() {
                  _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                });
              },
              controlsBuilder: (BuildContext context,
                  {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                return Row(
                  children: <Widget>[
                    TextButton(
                      onPressed: onStepContinue,
                      child: const Text('下一步'),
                    ),
                    TextButton(
                      onPressed: onStepCancel,
                      child: const Text('上一步'),
                    ),
                  ],
                );
              },
              steps: [
                Step(
                  title: Text('已付款'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('客户：夏庆鹏'),
                    Text('下单时间:2020-11-11 19:20'),
                  ],),
                 
                  content: SizedBox(
                    width: 400,
                    height: 20,
                    child: Text('亲，你的订单已成功下单'),
                  ),
                  isActive: _currentStep == 0,
                ),
                Step(
                  title: Text('已发货'),
                   subtitle: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                    Text('发货员：黄磊'),
                    Text('发货时间:2020-11-12 9:20'),
                  ],),
                  content: SizedBox(
                    width: 400,
                    height: 20,
                    child:  Text('已通知商家揽件'),
                  ),
                  
                 
                  isActive: _currentStep == 1,
                ),
                Step(
                  title: Text('派送中'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('派送员工：刘玉',textAlign: TextAlign.left,),
                    Text('派送时间:2020-11-13 10:20'),
                  ],),
                  content: SizedBox(
                    width: 400,
                    height: 20,
                    child:  Text('你的商品已在派送途中'),
                  ),
                  isActive: _currentStep == 2,
                ),
              ],
            )
          ],
        ),
      ),
    );
    // return EnptyPage(name: name, id: id,mark:mark);
  }
}
