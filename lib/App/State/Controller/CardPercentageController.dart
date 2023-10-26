import 'package:get/get.dart';

class CardPercentageController extends GetxController {


  double findPercentage(String amount, String targetAmount) {
    double amountDouble = double.parse(amount);
    double targetAmountDouble = double.parse(targetAmount);
    double percentageDouble = amountDouble / targetAmountDouble;
    return percentageDouble;
  }

  String showPercentage(String amount, String targetAmount) {
    int amountInt = int.parse(amount);
    int targetAmountInt = int.parse(targetAmount);
    int percentage = (amountInt * 100) ~/ targetAmountInt; // Calculate the percentage as an integer
    String percentageString = '$percentage%'; // Append "%" to the percentage value
    return percentageString;
  }
}
