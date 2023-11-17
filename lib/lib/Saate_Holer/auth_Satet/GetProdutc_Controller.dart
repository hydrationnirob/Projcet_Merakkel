import 'dart:convert';

import 'package:apitestproject/Models/GetProducModel.dart';
import 'package:apitestproject/Utils/URL/Url_Const.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class GetProduct_controller extends GetxController {
  var isLoading = true.obs;
 List<GetProductModel> productList = [];



  Future<void> getProduct() async {
    try {

      isLoading(true);
      var headers = {'Content-Type': 'application/json'};
      var URl = Uri.parse(APIPath.GetProduct);
      http.Response response = await http.get(URl, headers: headers);
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        productList = jsonResponse.map((e) => GetProductModel.fromMap(e)).toList();
        print(productList);

        for (var element in productList) {

          print(element.title);


        }
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }


}