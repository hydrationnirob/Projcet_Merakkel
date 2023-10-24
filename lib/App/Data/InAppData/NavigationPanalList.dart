import 'package:fluent_ui/fluent_ui.dart';
import 'package:projcet_merakkel/App/Ui/Screens/HomePage.dart';

class NavigationPanalList {
 static List<NavigationPaneItem> items = [
    PaneItem(
      icon: const Icon(FluentIcons.home),
      title: const Text('Home'),
      body:  const HomePage(),
    ),
    PaneItemSeparator(),
    PaneItem(
      icon: const Icon(FluentIcons.issue_tracking),
      title: const Text('Track orders'),
      infoBadge: const InfoBadge(source: Text('8')),
      body: const ScaffoldPage(
        header: Text('Track orders'),
        content: Center(
          child: Text(
            'This is the content of the Track orders page',
          ),
        ),
      ),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.payment_card),
      title: const Text('My Card'),
      body: const ScaffoldPage(
        header: const Text('Track orders'),
        content: const Center(
          child: Text(
            'This is the content of the Track orders page',
          ),
        ),
      ),
      enabled: true,
    ),
    PaneItem(
      icon: const Icon(FluentIcons.money),
      title: const Text('Finance Chart'),
      body: const ScaffoldPage(
        header: const Text('Track orders'),
        content: Center(
          child: Text(
            'This is the content of the Track orders page',
          ),
        ),
      ),
      enabled: true,
    ),




    PaneItemExpander(
      icon: const Icon(FluentIcons.account_management),
      title: const Text('Account'),
      body: const ScaffoldPage(
        header: Text('Track orders'),
        content: Center(
          child: Text(
            'This is the content of the Track orders page',
          ),
        ),
      ),
      items: [
        PaneItemHeader(header: const Text('Apps')),
        PaneItem(
          icon: const Icon(FluentIcons.mail),
          title: const Text('Mail'),
          body: const ScaffoldPage(
            header: Text('Track orders'),
            content: Center(
              child: Text(
                'This is the content of the Track orders page',
              ),
            ),
          ),
        ),
        PaneItem(
          icon: const Icon(FluentIcons.calendar),
          title: const Text('Calendar'),
          body:const ScaffoldPage(
            header: Text('Track orders'),
            content: Center(
              child: Text(
                'This is the content of the Track orders page',
              ),
            ),
          ),
        ),
      ],
    ),

  ];
}