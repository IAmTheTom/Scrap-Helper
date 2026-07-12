import 'package:flutter/material.dart';
import 'config/app_config.dart';

class ScrapHelperApp extends StatelessWidget {
  const ScrapHelperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text(AppConfig.appName)),
        body: const Center(
          child: Text(
            'Core foundation installed.\nNext: SQLite database.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
