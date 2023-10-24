import 'package:fluent_ui/fluent_ui.dart';

import 'Data/InAppData/NavigationPanalList.dart';
import 'Ui/Screens/HomePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Flutter Demo',
      theme: FluentThemeData(
        brightness: Brightness.light,
        accentColor: Colors.red,
      ),
      home: const MainNav(),
    );
  }
}

class MainNav extends StatefulWidget {
  const MainNav({super.key});

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int topIndex = 0;




  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar:  const NavigationAppBar(
        title: Text('Fluent UI Demo'),


      ),
      pane: NavigationPane(

        header: Text('Fluent UI Demo'),
        size: const NavigationPaneSize(openWidth: 300),
        displayMode: PaneDisplayMode.compact,
        selected: topIndex,
        onChanged: (index) => setState(() => topIndex = index),
        items: NavigationPanalList.items,
        footerItems: [
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: const Text('Settings'),
            body: const ScaffoldPage(
              header: Text('Track orders'),
              content: Center(
                child: Text(
                  'This is the content of the Track orders page',
                ),
              ),
            ),
          ),
          PaneItemAction(
            icon: const Icon(FluentIcons.add),
            title: const Text('Add New Item'),
            onTap: () {
              // Your Logic to Add New `NavigationPaneItem`
              NavigationPanalList.items.add(
                PaneItem(
                  icon: const Icon(FluentIcons.new_folder),
                  title: const Text('New Item'),
                  body: const Center(
                    child: Text(
                      'This is a newly added Item',
                    ),
                  ),
                ),
              );
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}