import 'package:flutter/material.dart';
import 'package:vertical_tabs/vertical_tabs.dart';
import 'category_detail.dart';
import 'dart:convert';
import '../../service/dio.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPage createState() => _CategoryPage();
}

class _CategoryPage extends State<CategoryPage> {
  var CategoryList = [];
  var ProductList = [];
  var _futureBuilderFuture;
  final List navigatorList = [
    {'name': '微信', 'id': 1, 'icon': 0xe621},
    {'name': '微博', 'id': 2, 'icon': 0xe504},
    {'name': 'QQ', 'id': 3, 'icon': 0xe685},
    {'name': '企业微信', 'id': 4, 'icon': 0xe637},
    {'name': '浏览器', 'id': 5, 'icon': 0xe508},
  ];
  @override
  Future getList() async {
    var res = await HttpController.get("/find_category", null);
    return res;
  }

  getCategory(catagory_id) async {
    var res = await HttpController.get(
        "/find_product", "?category_id=${catagory_id}");
    setState(() {
      if (res != null) {
        ProductList = res["data"];
      } else {
        ProductList = [];
      }
    });
    return res;
  }

  initState() {
    // TODO: implement initState
    super.initState();

    ///用_futureBuilderFuture来保存_gerData()的结果，以避免不必要的ui重绘
    _futureBuilderFuture = getList();
  }

  Tab _listViewItemUi(BuildContext context, item) {
    print(ProductList);
    return Tab(
        child: Container(
      height: 60.0,
      alignment: Alignment.center,
      child: Text("${item["category_name"]}"),
    ));
  }

  Widget _listContentUi(BuildContext context, item) {
    return Container(
      child: TabNavigator(ProductList: this.ProductList),
    );
  }

  Widget _gridViewItemUi(BuildContext context, item) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, item['name']);
        print(item);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: <Widget>[
          Icon(
            IconData(item['icon'], fontFamily: 'iconfont'),
           
            color: Colors.black45,
            // size: 20,
          ),
          Text(
            item['name'],
            // style: TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分类'),
        actions: <Widget>[
          IconButton(
              icon: new Icon(
                IconData(0xe63b, fontFamily: 'iconfont'),
                // size: 30,
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        child: GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 3,
                            childAspectRatio: 1.5,
                            padding: const EdgeInsets.only(top: 10.0),
                            children: navigatorList.map((item) {
                              return _gridViewItemUi(context, item);
                            }).toList()),
                      );
                    });
              }),
        ],
      ),
      body: FutureBuilder(
        future: _futureBuilderFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              print('还没有开始网络请求');
              return Text('还没有开始网络请求');
            case ConnectionState.active:
              print('active');
              return Text('ConnectionState.active');
            case ConnectionState.waiting:
              print('waiting');
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              print('done');
              print(snapshot.data);
              if (snapshot.data != null) {
                CategoryList = snapshot.data['data'];
              } else {
                CategoryList = [
                  {
                    {"category_id": 4, "category_name": "甄选生鲜"},
                  }
                ];
              }

              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              return VerticalTabs(
                  tabsWidth: 120,
                  selectedTabBackgroundColor: Colors.pink,
                  onSelect: (tabIndex) => {
                        print(CategoryList[tabIndex]),
                        getCategory(CategoryList[tabIndex]["category_id"])
                      },
                  tabs: CategoryList.map((item) {
                    return _listViewItemUi(context, item);
                  }).toList(),
                  contents: CategoryList.map((item) {
                    return _listContentUi(context, item);
                  }).toList());
            default:
              return Text('还没有开始网络请求');
          }
        },
      ),
    );
  }
}

class TabNavigator extends StatelessWidget {
  List ProductList;
  TabNavigator({Key key, this.ProductList});
  Widget _gridViewItemUi(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print(item);
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) {
          return CategoryDetailPage(
              product_name: item['product_name'],
              product_id: item['product_id']);
        }));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.network(
            "${item["product_image"]}",
            width: 60.0,
            height: 60.0,
            fit: BoxFit.contain,
          ),

          //   decoration: BoxDecoration(
          //     color: Colors.pink,
          //   ),
          // ),
          Text(
            "${item["product_name"]}",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 10.0),
          ),
          Container(
            //  height: 10.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("￥${item["current_price"]}",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.red)),
                Text(" ￥${item["market_price"]}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      height: 3000.0,
      child: GridView.count(
          // physics: const NeverScrollableScrollPhysics(), // 禁止滚动
          crossAxisCount: 2,
          children: ProductList.map((item) {
            return _gridViewItemUi(context, item);
          }).toList()),
    );
  }
}

//  child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,

//                           children: [
//                             ListTile(
//                               // leading:Icon(Icons.waterfall_chart),
//                               title: Text(
//                                 '分享到微信',
//                                 textAlign: TextAlign.center,
//                               ),
//                               onTap: () {
//                                 print('分享到微信');
//                                 Navigator.pop(context, '分享到微信');
//                               },
//                             ),
//                             ListTile(
//                               // leading:Icon(Icons.waterfall_chart),
//                               title: Text('分享到微博', textAlign: TextAlign.center),
//                               onTap: () {
//                                 print('分享到微博');
//                                 Navigator.pop(context, '分享到微博');
//                               },
//                             ),
//                             ListTile(
//                               //  leading:Icon(Icons.waterfall_chart),
//                               title: Text('分享到QQ', textAlign: TextAlign.center),
//                               onTap: () {
//                                 print('分享到QQ');
//                                 Navigator.pop(context, '分享到QQ');
//                               },
//                             ),
//                           ],
//                         ),
