import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home/home_page.dart';
import 'category/category_page.dart';
import 'car/car_page.dart';
import 'mine/mine_page.dart';
import 'package:provide/provide.dart';
import '../provide/tabbarIndex.dart';
// class IndexPage extends StatefulWidget {
//   _IndexPageState createState() => _IndexPageState();
// }

// class _IndexPageState extends State<IndexPage> {
//   final List<BottomNavigationBarItem> bottomTabs = [
//     BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.category), title: Text('分类')),
//     BottomNavigationBarItem(
//         icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车')),
//     BottomNavigationBarItem(
//         icon: Icon(CupertinoIcons.person), title: Text('我的')),
//   ];
//   final List tabBodies = [
//     HomePage(),
//     CategoryPage(),
//     CarPage(),
//     MinePage(),
//   ];
//   int currentIndex = 0;
//   var currentpage;
//   @override
//   void initState() {
//     currentpage = tabBodies[currentIndex];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.redAccent,
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: currentIndex,
//         items: bottomTabs,
//         onTap: (index) {
//           setState(() {
//             currentIndex = index;
//             currentpage = tabBodies[currentIndex];
//           });
//         },
//       ),
//       body: currentpage,
//     );
//   }
// }

class IndexPage extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.category), title: Text('分类')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.person), title: Text('我的')),
  ];
  var tabBodies = [
    HomePage(),
    CategoryPage(),
    CarPage(),
    MinePage(),
  ];

  var currentpage=null;
  @override
  Widget build(BuildContext context) {
    return Provide<TabbarIndex>(builder: (context, child, tabbarIndex) {
      print(tabbarIndex);
     
      return Scaffold(
        backgroundColor: Colors.redAccent,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: tabbarIndex.tabbarIndex,
          items: bottomTabs,
          onTap: (index) {
            Provide.value<TabbarIndex>(context).increment(index);
            currentpage = tabBodies[index];
          },
        ),
        body: currentpage==null ? HomePage(): currentpage,
      );
    });
  }
}
