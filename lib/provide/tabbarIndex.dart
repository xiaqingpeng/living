import 'package:flutter/material.dart';

class TabbarIndex with ChangeNotifier {
  int tabbarIndex = 0;
  increment(tabbarIndex) {
    tabbarIndex = tabbarIndex;
    notifyListeners();
  }
}
