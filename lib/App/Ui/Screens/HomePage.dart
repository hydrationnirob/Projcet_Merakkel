import 'package:fluent_ui/fluent_ui.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:projcet_merakkel/App/Ui/Utilities/Colors.dart';
import 'package:projcet_merakkel/App/Ui/Widgets/WalletCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      content: SingleChildScrollView(
        child: Column(
          children: [
            Row(
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
                    child: Container(
                      height: 200,
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 16, top: 16),
                            child: Text("Hello, Nirob!",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),

                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 16, top: 16),
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
                              padding: const EdgeInsets.only(left: 16, top: 8),
                              child: Text(
                                'Tk.1.410.985',
                                style: TextStyle(
                                  fontSize: 36,
                                  color:AppColors.primaryColor,
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
                      height: 200,
                      child: Center(
                        child: IconButton(
                          icon: const Icon(FluentIcons.circle_addition, size: 30.0),
                          onPressed: () => debugPrint('pressed button'),
                        )
                      )
                    ),
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
                      height: 200,
                      child: Center(
                        child: IconButton(
                          icon: const Icon(FluentIcons.admin_e_logo_inverse32, size: 30.0),
                          onPressed: () => debugPrint('pressed button'),
                        )
                      )
                    ),
                  ),
                ),
                Container(
                  width: 20,
                ),

              ],
            ),
            Container(
              height: 30,
            ),
          const Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.start,
            spacing: 20,
            runSpacing: 20,
            children: [
              WalletCard(),
              WalletCard(),
              WalletCard(),
              WalletCard(),
              WalletCard(),
              WalletCard(),


            ],
          )


          ],
        ),
      ),

    );
  }
}


