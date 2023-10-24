import 'package:fluent_ui/fluent_ui.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:projcet_merakkel/App/Ui/Utilities/Colors.dart';

class WalletCard extends StatelessWidget {
  final String title;
  final DateTime lastPaid;
  final String amount;
  final String tagetAmount;



  const WalletCard({
    super.key, required this.title, required this.lastPaid, required this.amount, required this.tagetAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Acrylic(
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),

          ),
          width: 350,
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0,left: 8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Image.asset('Images/asset/IconPng/Rectangle 10.png'),
                    ),
                    Text(title,style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 12,top: 5),
                child: Text("Last Paid on $lastPaid",style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                ),),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,bottom: 20),
                    child: RichText(
                      text:  TextSpan(
                        text: 'Tk. $amount',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                        children:  <TextSpan>[
                          TextSpan(text: ' /$tagetAmount', style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[80],
                          ),),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0,bottom: 20),
                    child: Text('  80%',style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),),
                  ),
                ],
              ),
              LinearPercentIndicator(
                barRadius: const Radius.circular(10),
                animateFromLastPercent: true,
                animation: true,
                width: 350,
                lineHeight: 15.0,
                percent: 0.8,
                backgroundColor: Colors.grey[30],
                progressColor: AppColors.secondaryColor,
              ),


            ],
          )
      ),
    );
  }
}