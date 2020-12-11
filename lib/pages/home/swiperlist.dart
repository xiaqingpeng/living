import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart'; //引入这个控件
class SwiperList extends StatelessWidget {
  @override
  List<Image> imgs = [
    //建立了一个图片数组
    Image.asset(
      "images/swiper1.png",
      fit: BoxFit.contain,
    ),
    Image.asset(
      "images/swiper2.png",
      fit: BoxFit.contain,
    ),
    Image.asset(
      "images/swiper3.png",
      fit: BoxFit.contain,
    ),
    Image.asset(
      "images/swiper4.png",
      fit: BoxFit.contain,
    ),
  ];

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 175,
            // margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              // borderRadius:
              //     const BorderRadius.all(const Radius.circular(10.0))
            ),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                //条目构建函数传入了index,根据index索引到特定图片
                return imgs[index];
              },
              itemCount: imgs.length,
              autoplay: true,
              pagination: new SwiperPagination(), //这些都是控件默认写好的,直接用
              control: null,
            ),
          )
        ],
      ),
    );
  }
}
