import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Models/GetProducModel.dart';
import 'Saate_Holer/auth_Satet/GetProdutc_Controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  GetProduct_controller controller = Get.find<GetProduct_controller>();

  List<GetProductModel> produs = [];

  void removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
  @override
  void initState() {
    print(produs.length);
    controller.getProduct();
    produs = controller.productList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: produs.length,
                itemBuilder: (context, index) {
                  return _buildBody(context, produs[index].title??"Title", produs[index].image??"", produs[index].price as String, produs[index].category??"");
                }),
          );
        }
      }),
    );
  }
}

Widget _buildBody( BuildContext context , String title , String image , String price, String category ) {
  return  Container(
    //width: MediaQuery.of(context).size.width * 0.45,
    decoration: BoxDecoration(
      color: const Color(0xFFF5F5F5),
      boxShadow: const [
        BoxShadow(
          blurRadius: 4,
          color: Color(0x3600000F),
          offset: Offset(0, 2),
        )
      ],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.network(
                    image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                  child: Text(
                     title,
                    style: const TextStyle(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF8B8B8B),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),

                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                  child: Text(
                    '\$${price}',
                    style: const TextStyle(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF8B8B8B),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                  child: Text(
                    category,
                    style: const TextStyle(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF8B8B8B),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
