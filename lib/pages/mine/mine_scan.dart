import 'package:flutter/material.dart';

import 'package:barcode_scan/barcode_scan.dart';

class MineScanPage extends StatelessWidget {
  Future BarCode() async {
    var result = await BarcodeScanner.scan();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: BarCode(),
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
              return Scaffold(
                appBar: AppBar(
                  title: Text('扫一扫'),
                ),
                body: Center(
                  child: Icon(
                    Icons.hourglass_empty_rounded,
                    size: 100.0,
                    color: Colors.pink,
                  ),
                ),
              );

            default:
              return Text('还没有开始网络请求');
          }
        },
      ),
    );
  }
}
