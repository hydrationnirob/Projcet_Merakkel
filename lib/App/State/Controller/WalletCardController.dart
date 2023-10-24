import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:projcet_merakkel/App/Ui/Widgets/WalletCard.dart';

class WalletCardController extends GetxController {

  final RxBool isCardAdded = true.obs;

  final _walletCards = <Widget>[
    const WalletCard(),
  ].obs;

  List<Widget> get walletCards => _walletCards;

  void addCard() {
    if (_walletCards.length == 4) {
      isCardAdded.value = false;
    }

    _walletCards.add(const WalletCard());
  }
}


