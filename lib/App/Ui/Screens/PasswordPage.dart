import 'package:fluent_ui/fluent_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Acrylic(
      child: ScaffoldPage(
        content: Center(
          child: Text(
            'This is the content of the Password page',
          ),
        ),),
    );
  }
}
