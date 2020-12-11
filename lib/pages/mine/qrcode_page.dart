import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class QrcodePage extends StatelessWidget {
  int id;
  String name;
  QrcodePage({Key key, this.name,this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        title: Text('$name'),
      ),
      body: Center(
        child:   QrImage(
            data: 'https://www.baidu.com/',
            size: 200,
            embeddedImage: NetworkImage(
                'https://img2.woyaogexing.com/2019/09/06/f9afde08c5a4460cb08389a6c7f74c7a!600x600.jpeg'),
            embeddedImageStyle: QrEmbeddedImageStyle(
              size: Size(50, 50),
            ),
          ),

      ),
    );
  }
}
