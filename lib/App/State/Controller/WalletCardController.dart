import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:projcet_merakkel/App/Ui/Widgets/WalletCard.dart';


class WalletCardController extends GetxController {



  final RxBool isCardAdded = true.obs;

  final walletCards = <Widget>[
     WalletCard(
      title: 'Food',
      lastPaid: DateTime(2021, 10, 10),
      amount: '200',
      tagetAmount: '500',
    ),
  ].obs;



  void addCard(title, lastPaid, amount, tagetAmount) {
    if (walletCards.length == 4) {
      isCardAdded.value = false;
    }

    walletCards.add( WalletCard(
      title: title,
      lastPaid: lastPaid,
      amount: amount,
      tagetAmount: tagetAmount,
    ));
  }

  //find percentage
  double findPercentage(amount,tagetAmount){
    double amountDouble = double.parse(amount);
    double tagetAmountDouble = double.parse(tagetAmount);
    double percentage = amountDouble/tagetAmountDouble;
    return percentage;
  }


}


