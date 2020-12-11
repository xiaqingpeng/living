import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

class IncomeDetailPage extends StatefulWidget {
  int id;
  String name;
  IncomeDetailPage({Key key, this.name, this.id}) : super(key: key);
  @override
  _MyAppState createState() => new _MyAppState(id: this.id, name: this.name);
}

class _MyAppState extends State<IncomeDetailPage> {
  int id;
  String name;
  String MenuItem = '今天';
  _MyAppState({Key key, this.name, this.id});
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('$name'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(MenuItem),
              PopupMenuButton(
                  icon: Icon(Icons.date_range),
                  offset: Offset(80,80),
                  onSelected: (value) {
                    print(value);
                    setState(() => {
                      MenuItem = value
                    });
                  },
                  itemBuilder: (BuildContext context) => [
                        PopupMenuItem(value: '今天', child: Text('今天')),
                        PopupMenuItem(value: '本周', child: Text('本周')),
                        PopupMenuItem(value: '本月', child: Text('本月'))
                      ])
            ],
          )
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Text('我的收入明细'),
          Container(
            child: Echarts(
              option: '''
    {
      xAxis: {
        type: 'category',
        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
      },
      yAxis: {
        type: 'value'
      },
      series: [{
        data: [820, 932, 901, 934, 1290, 1330, 1320],
        type: 'line'
      }]
    }
  ''',
            ),
            width: 300,
            height: 250,
          )
        ],
      ),
    );
  }
}
