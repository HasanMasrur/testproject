import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert' show Base64Decoder, base64;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:textproject/model/modelprovider.dart';
import 'package:textproject/page/detailspage.dart';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Homepage();
  }
}

class _Homepage extends State<Homepage> {
  Modelprovide model = Modelprovide();
  String _base64;
  @override
  void initState() {
    model.fatchfirstapi();
    super.initState();
  }

  Future<void> _refreshapicall(BuildContext context) async {
    await Provider.of<Modelprovide>(context, listen: false).fatchfirstapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('call api')),
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.all(20), height: 100, child: TextField()),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 400,
              width: 600,
              child: FutureBuilder(
                  future: _refreshapicall(context),
                  builder: (context, snapshot) => snapshot.connectionState ==
                          ConnectionState.waiting
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : RefreshIndicator(
                          onRefresh: () => _refreshapicall(context),
                          child: Consumer<Modelprovide>(
                              builder: (context, model, child) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final data = model.apidata[index];
                                  var pic = data.filename;

                                  // String _base64 =
                                  //     base64.encode(data.filename.toString;
                                  //   var photo = base64.decode(pic.toString());
                                  Uint8List _bytesImage =
                                      Base64Decoder().convert(pic.toString());
                                  // Uint8List _bytesImage = Base64Decoder()
                                  //     .convert(
                                  //         data.filename.split('.jpg').last);
                                  // print(photo);
                                  return PopularBox(_bytesImage);
                                },
                                itemCount: model.apidata.length);
                          }))),
            ),
          ],
        ));
  }
}
