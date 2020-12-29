import 'package:flutter/material.dart';

import 'package:textproject/model/model.dart';

class PopularBox extends StatelessWidget {
  final data;
  PopularBox(this.data);
  var image1 = String;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 20),
                    height: 160,
                    width: 280,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      // image: DecorationImage(
                      //   image: NetworkImage(data.content_type),
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                    child: Image.memory(data),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
