import 'dart:math';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:isar/isar.dart';

import 'package:projcet_merakkel/App/Data/UserData/Local_db/local_db.dart';
import 'package:projcet_merakkel/App/Models/UserModel.dart';
import 'package:projcet_merakkel/App/Models/WalletModel.dart';
import 'package:projcet_merakkel/App/State/Controller/WalletCardController.dart';
import 'package:projcet_merakkel/App/Ui/Screens/LoginPage.dart';
import 'package:projcet_merakkel/App/Ui/Utilities/Colors.dart';
import 'package:projcet_merakkel/App/Ui/Widgets/WalletCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {
  final TextEditingController _walletNamecontroller = TextEditingController();
  final TextEditingController _walletGoalcontroller = TextEditingController();
  final TextEditingController _walletAmountcontroller = TextEditingController();

   int TempTotalAmount = 0;


void saveData(title,lastPaid,amount,tagetAmount,totalAmount) async {


  final walletModel = WalletModel(
    id: Isar.autoIncrement,
    Title: title,
    LastPaid: lastPaid,
    Amount: amount,
    TagetAmount: tagetAmount,
    TotalAmount: totalAmount,

  );
  await localdb.SaveWallet(walletModel);


}

Future<String> ReadUserModel() async {
  final isar = await localdb.db;
  final user = await isar.userModels.where().findFirst();
  return user!.Name;
}


  @override
  void initState() {
    ReadUserModel();
    super.initState();
  }


  final localdb= LocalDbServices();

  DateTime? selected;
  final WalletCardController walletCardController = Get.put(WalletCardController());

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Wallet',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Keep track your financial plan',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            Container(
              height: 20,
            ),
          ],
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeroCard(),


           StreamBuilder<List<WalletModel>>(
              stream: LocalDbServices().getWallets(),
              builder: (context, snapshot) {
                if (snapshot.data==null)
                  {
                    return const Center(child: Text('No Wallet Created Yet'),);
                  }
                final Wallet = snapshot.data;

                return SizedBox(
                  height: 200,
                  //width: MediaQuery.of(context).size.width*0.4,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return WalletCard(
                        title: Wallet[index].Title,
                        lastPaid: Wallet[index].LastPaid,
                        amount: Wallet[index].Amount,
                        tagetAmount: Wallet[index].TagetAmount,
                      );

                    },
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 10,
                    ),
                    itemCount: Wallet!.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                  ),
                );
              }

            ),

          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 90,
            child: Button(
              child: Center(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                    child: Icon(
                      FluentIcons.circle_addition_solid,
                      size: 30,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5),
                    child: Text(
                      'Create New Wallet',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )),
              onPressed: () => walletCardController.isCardAdded == true
                  ? showContentDialog(context)
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  Row HeroCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 20,
        ),
        Expanded(
          flex: 2,
          child: Acrylic(
            elevation: 4,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            blurAmount: 10,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16, top: 5),
                    //show  Name from local db UserModel
                    child: Text( '',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, top: 5),
                    child: Text(
                      'Total Balance',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  StreamBuilder<List<WalletModel>>(
                    stream: LocalDbServices().getWallets(),
                    builder: (context, snapshot) {
                      if (snapshot.data==null)
                      {
                        return const Center(child: Text('No Balance'),);
                      }

                      final Wallet = snapshot.data;

                      return Padding(
                        padding: const EdgeInsets.only(left: 10, top: 8),
                        child: Text( Wallet!.fold(0, (previousValue, element) => previousValue + element.TotalAmount).toString(),
                          style: TextStyle(
                            fontSize: 30,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, top: 8),
                    child: Text(
                      'This month',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: 20,
        ),
        Expanded(
          flex: 1,
          child: Acrylic(
            blurAmount: 4,
            elevation: 4,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Center(
                    child: IconButton(
                  icon: const Icon(FluentIcons.circle_addition, size: 30.0),
                  onPressed: () => Navigator.pushAndRemoveUntil(context, FluentPageRoute(builder: (context) =>  LoginPage(),), (route) => true),
                ))),
          ),
        ),
        Container(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: Acrylic(
            blurAmount: 4,
            elevation: 4,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Center(
                    child: IconButton(
                  icon: const Icon(FluentIcons.admin_e_logo_inverse32,
                      size: 30.0),
                  onPressed: () => debugPrint('pressed button'),
                ))),
          ),
        ),
        Container(
          width: 20,
        ),
      ],
    );
  }

  void showContentDialog(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => ContentDialog(
        style: const ContentDialogThemeData(
          titlePadding: EdgeInsets.all(5),
          titleStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        title: const Text('Add New Wallet'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text('Give your wallet a name so you can easily'),
            const SizedBox(
              height: 10,
            ),
            TextBox(
              controller: _walletNamecontroller,
              placeholder: 'Health Saving',
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('What is your goal for this wallet?'),
            const SizedBox(
              height: 10,
            ),
            TextBox(
              controller: _walletGoalcontroller,
              placeholder: '10000',
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('How much do you want to save Now?'),
            const SizedBox(
              height: 10,
            ),
            TextBox(
              controller: _walletAmountcontroller,
              placeholder: '5000',
            ),
          ],
        ),
        actions: [
          Button(
            child: const Text('Cancel'),
            onPressed: () {
              _walletNamecontroller.clear();
              _walletGoalcontroller.clear();
              _walletAmountcontroller.clear();
              Navigator.pop(context,);
              displayInfoBar(context, builder: (context, close) {
                return const InfoBar(
                  isLong: true,
                  title:  Text(' Wallet Not Created'),
                  content:
                  Text('You can create a wallet later.'),
                  severity: InfoBarSeverity.warning,
                );

               });
              // Delete file here
            },
          ),
          FilledButton(
            child: const Text('Create'),
            onPressed: () => {
              if (_walletNamecontroller.text.isNotEmpty &&
                  _walletGoalcontroller.text.isNotEmpty &&
                  _walletAmountcontroller.text.isNotEmpty)
                {

                  TempTotalAmount= TempTotalAmount + int.parse(_walletAmountcontroller.text),
                  print(TempTotalAmount),
                  saveData(_walletNamecontroller.text, DateTime.now(), _walletAmountcontroller.text, _walletGoalcontroller.text, TempTotalAmount),

                  walletCardController.addCard(
                    _walletNamecontroller.text,
                    DateTime.now(),
                    _walletAmountcontroller.text,
                    _walletGoalcontroller.text,
                  ),





                  Navigator.pop(context, 'Wallet Created'),


                  displayInfoBar(context, builder: (context, close) {
                    return const InfoBar(
                      isLong: true,
                      title:  Text(' Congratulations Your Wallet Has been Created'),
                      content:
                      Text('Now You can Manage Your Wallet And fill your Gaol.'),
                      severity: InfoBarSeverity.success,
                    );
                  }),
                }

              else
                {


                  displayInfoBar(context, builder: (context, close) {
                    return const InfoBar(
                      isLong: true,
                      title:  Text(' Please Fill All The Field'),
                      content:
                      Text('You have to fill all the field to create a wallet.'),
                      severity: InfoBarSeverity.warning,
                    );
                  }),
                }




            },
          ),
        ],
      ),

    );
    if(result=='Wallet Created')
      {
        setState(() {});
      }

  }
}
