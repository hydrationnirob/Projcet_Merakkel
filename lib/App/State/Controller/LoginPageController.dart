import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginPageController extends GetxController {
  RxBool checked = false.obs;

  // Use Rx variables for reactive updates
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool buttonDisabled() {
    return nameController.text.isEmpty || passwordController.text.isEmpty;
  }
}
