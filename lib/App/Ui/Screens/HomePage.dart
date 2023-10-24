import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:projcet_merakkel/App/State/Controller/WalletCardController.dart';
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

  DateTime? selected;
  final WalletCardController walletCardController =
      Get.put(WalletCardController());

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
          Obx(
            () => SizedBox(
              height: 200,
              //width: MediaQuery.of(context).size.width*0.4,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return walletCardController.walletCards[index];
                },
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 10,
                ),
                itemCount: walletCardController.walletCards.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
              ),
            ),
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
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, top: 5),
                      child: Text("Hello, Nirob!",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, top: 5),
                      child: Text(
                        'Total Balance',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 8),
                      child: Text(
                        'Tk.1.410.985',
                        style: TextStyle(
                          fontSize: 30,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, top: 8),
                      child: Text(
                        'This month',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
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
                  onPressed: () => debugPrint('pressed button'),
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
            const SizedBox(
              height: 10,
            ),
            const Text(' Set your Target Date'),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
        actions: [
          Button(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context, 'Cancel Wallet Creation');
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
                  walletCardController.addCard(
                    _walletNamecontroller.text,
                    DateTime(
                        DateTime.now().day,
                        DateTime.now().month,
                        DateTime.now().year,
                        DateTime.now().hour,
                        DateTime.now().minute),
                    _walletAmountcontroller.text,
                    _walletGoalcontroller.text,
                  ),
                  Navigator.pop(context, 'Wallet Created'),

                  displayInfoBar(context, builder: (context, close) {
                    return InfoBar(
                      isLong: true,
                      title:  const Text(' Congratulations Your Wallet Has been Created'),
                      content:
                      const Text('Now You can Manage Your Wallet And fill your Gaol.'),
                      action: IconButton(
                        icon: const Icon(FluentIcons.clear),
                        onPressed: close,
                      ),
                      severity: InfoBarSeverity.success,
                    );
                  }),
                }

              else
                {
                  displayInfoBar(context, builder: (context, close) {
                    return InfoBar(
                      isLong: true,
                      title:  const Text(' Please Fill All The Field'),
                      content:
                      const Text('You have to fill all the field to create a wallet.'),
                      action: IconButton(
                        icon: const Icon(FluentIcons.clear),
                        onPressed: close,
                      ),
                      severity: InfoBarSeverity.warning,
                    );
                  }),
                }




            },
          ),
        ],
      ),
    );
    setState(() {});
  }
}
