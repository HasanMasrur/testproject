import 'package:flutter/material.dart';

class Modeldata {
  String key_name;
  String value;
  String display_name;
  String description;
  String content_type;
  String filename;
  String creation_date;
  String last_update;

  Modeldata(
      {@required this.key_name,
      @required this.value,
      @required this.display_name,
      @required this.description,
      @required this.content_type,
      @required this.filename,
      @required this.creation_date,
      @required this.last_update});
}
