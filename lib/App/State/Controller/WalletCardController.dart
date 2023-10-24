import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:projcet_merakkel/App/Ui/Widgets/WalletCard.dart';
import 'package:shared_preferences/shared_preferences.dart';


class WalletCardController extends GetxController {

  void UserWalletData()async {

    // Obtain shared preferences.
    final SharedPreferences walletData = await SharedPreferences.getInstance();
    //store walleCards List in walletData
    walletData.setStringList('walletCards', walletCards.map((e) => e.toString()).toList());
    walletData.setInt('WalletCount', walletCards.length);


  }

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
}


