import 'package:flutter/material.dart';

class Credential {
  Credential({@required this.username, @required this.password});
  String username;
  String password;
}

List<Credential> credentials = [
  // list of models
  Credential(username: "daniel", password: "danpass"),
  Credential(username: "shahid", password: "shapass"),
  Credential(username: "deeptarshi", password: "deepass"),
  Credential(username: "gaurav", password: "gaupass"),
];
