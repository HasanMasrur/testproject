import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:textproject/model/model.dart';

class Modelprovide with ChangeNotifier {
  List<Modeldata> _apilist = [];

  List<Modeldata> get apidata {
    return _apilist;
  }

  Future<Null> fatchfirstapi([bool filterByUser = false]) async {
    return await http
        .get(
            'https://labapi.yuma-technology.co.uk:8443/delivery/config/course/property/category')
        .then<Null>((http.Response response) {
      print(response.body);
      List<Modeldata> _dataList = [];
      List<dynamic> _fatchdata = json.decode(response.body);

      _fatchdata.forEach((dynamic datalist) {
        final Modeldata _ambulance = Modeldata(
          key_name: datalist['key_name'],
          value: datalist['value'],
          display_name: datalist['display_name'],
          description: datalist['description'],
          content_type: datalist['content_type'],
          filename: datalist['filename'],
          creation_date: datalist['creation_date'],
          last_update: datalist['last_update'],
        );
        print(_ambulance.filename);
        _dataList.add(_ambulance);
      });

      _apilist = _dataList;

      print(' tokendata');
      print(_apilist.length);
    });
  }
}
