import 'dart:convert';

import 'package:apitestproject/HomeScreen.dart';
import 'package:apitestproject/Utils/URL/Url_Const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegistrationController extends GetxController{



  TextEditingController FName = TextEditingController();
  TextEditingController LName = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  final Future<SharedPreferences> _prefer = SharedPreferences.getInstance();

  Future<void> UserReg() async  {
    try {
      var headers = {'Content-Type': 'application/json'};
      var URl = Uri.parse(APIPath.Registration);
      /* Map Body = {
      "name": "${FName.text} ${LName.text}",
      "email": Email.text,
      "password": Password.text,
    };*/
      Map Body = {
        "name": "Rajesffh",
        "email": "ndawga@gmail.com",
        "password": "123456",
      };

      http.Response response = await http.post(URl, headers: headers, body: jsonEncode(Body));
      if (response.statusCode == 200) {
        final GetRespoce = jsonDecode(response.body);
        var message = GetRespoce['message'];
        if ( message == "success"){
          var token = GetRespoce['data']['Token'];
          print(token);
          final SharedPreferences Userprefs = await _prefer;
          Userprefs.setString('token', token);
          Future.delayed(const Duration(seconds: 2));
          Get.to(const HomeScreen());
          FName.clear();
          LName.clear();
          Email.clear();
          Password.clear();
        }
        else{
          print(message);
          Get.snackbar('Error', message, snackPosition: SnackPosition.BOTTOM);
        }

        print(GetRespoce);
      }
    } catch (e) {
      print('Error: $e');
    }
}




}