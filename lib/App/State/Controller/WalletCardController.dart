import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:projcet_merakkel/App/Ui/Widgets/WalletCard.dart';

class WalletCardController extends GetxController {

  final RxBool isCardAdded = true.obs;

  final _walletCards = <Widget>[
     WalletCard(
      title: 'Food',
      lastPaid: DateTime(2021, 10, 10),
      amount: '200',
      tagetAmount: '500',
    ),
  ].obs;

  List<Widget> get walletCards => _walletCards;

  void addCard(title, lastPaid, amount, tagetAmount) {
    if (_walletCards.length == 4) {
      isCardAdded.value = false;
    }

    _walletCards.add( WalletCard(
      title: title,
      lastPaid: lastPaid,
      amount: amount,
      tagetAmount: tagetAmount,
    ));
  }
}


