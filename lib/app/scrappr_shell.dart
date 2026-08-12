part of '../main.dart';

class _ScrapprAppState extends State<ScrapprApp> {
  late final AppDatabase database;
  late final PersistenceService persistence;
  ScrapprModel? loadedModel;
  int tab = 0;
  ScrapprModel get model => loadedModel!;

  @override
  void initState() {
    super.initState();
    database = AppDatabase();
    persistence = PersistenceService(database);
    unawaited(_load());
  }

  Future<void> _load() async {
    final loaded = await persistence.loadOrSeed();
    loaded.assistantService = AssistantService(database);
    if (!mounted) return;
    setState(() => loadedModel = loaded);
  }

  void changed() {
    setState(() {});
    persistence.scheduleSave(model);
  }

  @override
  void dispose() {
    unawaited(persistence.closeWhenSaved());
    super.dispose();
  }

  void goTo(int index) => setState(() => tab = index);
  @override
  Widget build(BuildContext context) {
    if (loadedModel == null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Scrappr',
        home: const Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }
    final screens = [
      TodayScreen(model: model, changed: changed, goTo: goTo),
      InboxScreen(model: model, changed: changed),
      RunsScreen(model: model, changed: changed),
      ProcessingScreen(model: model, changed: changed),
      CaptureScreen(model: model, changed: changed),
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
              icon: Icon(Icons.add_a_photo_outlined),
              label: 'Capture',
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
