part of '../main.dart';

class _ScrapprAppState extends State<ScrapprApp> {
  final model = ScrapprModel.seeded();
  int tab = 0;
  void changed() => setState(() {});
  void goTo(int index) => setState(() => tab = index);
  @override
  Widget build(BuildContext context) {
    final screens = [
      TodayScreen(model: model, changed: changed, goTo: goTo),
      InboxScreen(model: model, changed: changed),
      RunsScreen(model: model, changed: changed),
      ProcessingScreen(model: model, changed: changed),
      LibraryScreen(model: model, changed: changed),
      ReportsScreen(model: model, changed: changed),
      SettingsScreen(model: model, changed: changed),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scrappr',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff356b3b)),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xff72b878),
      ),
      home: Scaffold(
        body: screens[tab],
        bottomNavigationBar: NavigationBar(
          selectedIndex: tab,
          onDestinationSelected: goTo,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.today_outlined),
              label: 'Today',
            ),
            NavigationDestination(
              icon: Icon(Icons.inbox_outlined),
              label: 'Inbox',
            ),
            NavigationDestination(
              icon: Icon(Icons.route_outlined),
              label: 'Runs',
            ),
            NavigationDestination(
              icon: Icon(Icons.construction_outlined),
              label: 'Processing',
            ),
            NavigationDestination(
              icon: Icon(Icons.inventory_2_outlined),
              label: 'Library',
            ),
            NavigationDestination(
              icon: Icon(Icons.bar_chart_outlined),
              label: 'Reports',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
