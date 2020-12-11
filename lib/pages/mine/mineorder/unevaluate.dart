import 'package:flutter/material.dart';
import './enpty.dart';

class UnEvaluatePage extends StatelessWidget {
  int id;
  String name;
  String mark;
  UnEvaluatePage({Key key, this.name, this.id, this.mark}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return EnptyPage(name: name, id: id, mark: mark);
  }
}
