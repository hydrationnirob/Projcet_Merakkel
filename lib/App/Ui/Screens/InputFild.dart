import 'dart:ui';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:projcet_merakkel/App/Ui/Utilities/Colors.dart';

class InputField extends StatefulWidget {
  InputField({super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final FocusNode focusNodeOne = FocusNode();

  final FocusNode focusNodeTwo = FocusNode();

  final FocusNode focusNodeThree = FocusNode();

  final FocusNode focusNodeFour = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Acrylic(
      child: ScaffoldPage(
        content: RawKeyboardListener(
          autofocus: true, // Allow global shortcuts without any specific text field focus
          focusNode: FocusNode(),
          onKey: (RawKeyEvent event) {
            if (event is RawKeyDownEvent) {
              if (event.logicalKey == LogicalKeyboardKey.keyD && event.isControlPressed) {
                print('Ctrl + D pressed');
                showContentDialog(context);
              }
            }
          },
          child: Column(
            children: [
              const Text('This is the content of the Track orders page'),
              Row(
                children: [
                  Expanded(
                    child: TextBox(
                      focusNode: focusNodeOne,
                      onSubmitted: (value) {
                        focusNodeOne.unfocus();
                        FocusScope.of(context).requestFocus(focusNodeTwo);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextBox(
                      focusNode: focusNodeTwo,
                      onSubmitted: (value) {
                        focusNodeTwo.unfocus();
                        FocusScope.of(context).requestFocus(focusNodeThree);
                        showContentDialog(context);
                      },
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Button(
                  child: const Text('Show dialog'),
                  onPressed: () => showContentDialog(context),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }

  void showContentDialog(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Delete file permanently?'),
        content: const Text(
          'If you delete this file, you won\'t be able to recover it. Do you want to delete it?',
        ),
        actions: [
          Button(
            child: const Text('Delete'),
            onPressed: () {
              Navigator.pop(context, 'User deleted file');
              // Delete file here
            },
          ),
          FilledButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context, 'User canceled dialog'),
          ),
        ],
      ),
    );
    setState(() {});
  }
}
