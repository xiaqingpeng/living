import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import '../../service/dio.dart';

const String VIDEO_URL = 'https://www.runoob.com/try/demo_source/mov_bbb.mp4';

class CategoryDetailPage extends StatefulWidget {
  int product_id;
  String product_name;
  CategoryDetailPage({Key key, this.product_name, this.product_id})
      : super(key: key);

  _HomeContentState createState() => _HomeContentState(
      product_id: this.product_id, product_name: this.product_name);
}

class _HomeContentState extends State<CategoryDetailPage> {
  int product_id;
  String product_name;
  var ProductDetail;
  _HomeContentState({Key key, this.product_name, this.product_id});
  VideoPlayerController _controller;
  Future _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(VIDEO_URL);
    _controller.setLooping(true);
    _initializeVideoPlayerFuture = _controller.initialize();
    getProductDetail(product_id);
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  getProductDetail(product_id) async {
    var res =
        await HttpController.get("/find_product", "?product_id=${product_id}");
    setState(() {
      ProductDetail = res["data"][0];
    });
    return res;
  }

  Widget build(BuildContext context) {
    print("$ProductDetail    +++++++++");
    return Scaffold(
      appBar: AppBar(
        title: Text('${product_name}'),
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              print(snapshot.connectionState);
              if (snapshot.hasError) print(snapshot.error);
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  // aspectRatio: 16 / 9,
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          SizedBox(height: 30),
          RaisedButton(
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
            onPressed: () {
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  // If the video is paused, play it.
                  _controller.play();
                }
              });
            },
          )
        ],
      ),
    );
  }
}
