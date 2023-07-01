import 'dart:convert';

import 'package:booktickets/model/userA.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
 static late SharedPreferences _preferences;
 static const _keyUser = 'user';

  static const myUser = User(
    imagePath: "assets/images/tintin.png",
    name: "Tin Tin",
    email: "tintin@gmail.com",
    about: "Looking for another journey",
    Gender: "M",
    PhoneNumber: "09121111234",
    BirthDay: "1380/1/1",
    isDarMode: false,
  );

 static Future init() async =>
    _preferences = await SharedPreferences.getInstance();
 static Future setUser(User user) async {
   final json = jsonEncode(user.toJson());
   await _preferences.setString(_keyUser, json);
 }
 static User getUser(){
   final json = _preferences.getString(_keyUser);
   return json== null ? myUser : User.fromJson(jsonDecode(json));
 }
}