import 'dart:convert';

import 'package:apitestproject/HomeScreen.dart';
import 'package:apitestproject/Utils/URL/Url_Const.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegetiomContoller extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final Future<SharedPreferences> _prefer = SharedPreferences.getInstance();

  RxString Ltoken = 'Not Token '.obs;




  Future<void> UserRegistation() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var URl = Uri.parse(APIPath.Login);
      Map Body = {
        "email": email.text,
        "password": password.text,
      };

      http.Response response =
          await http.post(URl, headers: headers, body: jsonEncode(Body));


      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print(jsonResponse);

        if (jsonResponse['message'] == 'success') {
          var token = jsonResponse['data']['Token'];
          print(token);
          final SharedPreferences Userprefs = await _prefer;
          Userprefs.setString('token', token);
          Ltoken.value = token;
          Future.delayed(const Duration(seconds: 2));
          Get.offAll(const HomeScreen());
          email.clear();
          password.clear();
        } else {
          var message = jsonResponse['message'];
          print(message);
          Get.snackbar('Error', message, snackPosition: SnackPosition.BOTTOM);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
