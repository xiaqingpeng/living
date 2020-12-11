import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import './pages/index_page.dart';
import './pages/home/home_page.dart';
import 'pages/category/category_detail.dart';
import './provide/counter.dart';
import './provide/theme.dart';
import './provide/tabbarIndex.dart';


void main() {
  var counter = Counter();
  var theme = ThemeColor(); //主题颜色
  var tabbarIndex = TabbarIndex(); // tabbarIndex
  var provides = Providers();

  provides
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ThemeColor>.value(theme))
    ..provide(Provider<TabbarIndex>.value(tabbarIndex));
  runApp(ProviderNode(child: MyApp(), providers: provides));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final routes = {
    
    '/category_search': (BuildContext context) => new CategoryDetailPage(),
    '/home_page': (BuildContext context) => new HomePage(),
   
  };

  @override
  Widget build(BuildContext context) {
    return Provide<Counter>(builder: (context, child, counter) {
      print(counter.value);
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false, // 去除debugger
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: IndexPage(),
        routes: routes,
      );
    });
  }
}
