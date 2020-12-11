import 'package:flutter/material.dart';

class ThemeColor with ChangeNotifier {
   Color theme = Color.fromRGBO(255, 0, 0, 1);
  changeTheme(theme) {
    theme = theme;
    print(theme);
    notifyListeners();
  }
}
