import 'package:flutter/material.dart';
import 'dart:convert';

class MineDetailPage extends StatelessWidget {
  int id;
  String name;
  MineDetailPage({Key key, this.name,this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        title: Text('$name'),
      ),
      body: Center(
        child: Text('$name'),
      ),
    );
  }
}
