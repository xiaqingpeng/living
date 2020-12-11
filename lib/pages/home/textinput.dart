import 'package:flutter/material.dart';
class TextInputList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TextFieldAndCheckPageState();
}

class TextFieldAndCheckPageState extends State<TextInputList> {
  @override
  Widget build(BuildContext context) {
    void _textFieldChanged(String str) {
      print(str);
    }

    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              prefixIcon: Icon(Icons.search),
              hintText: "请输查询入商品",
            ),
            onChanged: _textFieldChanged,
            autofocus: true,
          ),
        ],
      ),
    );
  }
}
