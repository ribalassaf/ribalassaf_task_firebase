import 'package:flutter/material.dart';

class User {
  String first_name;
  String last_name;
  String fullname;
  String birthday;
  bool admin;
  User(
      {this.first_name,
      this.last_name,
      this.fullname,
      this.admin,
      this.birthday});
}
