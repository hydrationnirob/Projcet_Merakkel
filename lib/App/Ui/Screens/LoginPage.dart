import 'package:fluent_ui/fluent_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:projcet_merakkel/App/Data/UserData/Local_db/local_db.dart';
import 'package:projcet_merakkel/App/Models/UserModel.dart';
import 'package:projcet_merakkel/App/MyApp.dart';
import 'package:projcet_merakkel/App/Ui/Screens/HomePage.dart';

import 'PasswordPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool checked = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool disabled = false;

  bool buttonDisabled ()
  {
    if(nameController.text.isEmpty || passwordController.text.isEmpty)
      {
        return true;
      }
    else
      {
        return false;
      }
  }

  void saveData(name,password) async {


    final UserModel userModel = UserModel(
      id: Isar.autoIncrement,
      Name: name,
      Email: '$name@gmail.com',
      Password: password,
    );
    await localdb.SaveUser(userModel);



  }


  final localdb= LocalDbServices();


  @override
  Widget build(BuildContext context) {
    return   Acrylic(
      child: ScaffoldPage(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('Images/asset/IconPng/Rectangle 4.png'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Text(
                        'Welcome Back',
                        style: GoogleFonts.bebasNeue(

                          color: Colors.orange,
                          fontSize: 60,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        'We are glad to see you back with us',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/8,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/4,
                        child: InfoLabel(

                          label: 'Enter your name:',
                          child:  TextBox(
                            controller: nameController,
                            placeholder: 'Name',
                            expands: false,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/4,
                        child: InfoLabel(

                          label: 'Enter your Password:',
                          child:  PasswordBox(
                            controller: passwordController,
                            revealMode: PasswordRevealMode.peekAlways,
                          ),
                        )
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width/4.5,
                            child: InfoLabel(
                              label: 'Remember me:',
                            ),
                          ),
                          ToggleSwitch(
                            checked: checked,
                            onChanged:  (v) => setState(() => checked = v),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/4,
                        height: MediaQuery.of(context).size.height/20,
                        child: FilledButton(
                          onPressed: buttonDisabled() ? null : () =>
                          {
                            saveData(nameController.text,passwordController.text),
                            Navigator.pushAndRemoveUntil(context, FluentPageRoute(builder: (context) =>  const MainNav(),), (route) => true),
                          },
                          child:  const Center(child: Text('Create Wallet')),
                        )
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have an account? ',
                            style: GoogleFonts.lato(
                              fontSize: 14,
                            ),
                          ),
                          IconButton(

                            icon:  Icon(FluentIcons.azure_key_vault, size: 24.0,color: Colors.red,),
                            onPressed: disabled ? null : () => Navigator.pushAndRemoveUntil(context, FluentPageRoute(builder: (context) =>  const PasswordPage(),), (route) => true),
                          )
                        ],
                      ),






                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }


}
