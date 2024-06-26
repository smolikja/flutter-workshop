import 'package:flutter/material.dart';
import 'package:flutter_workshop/core/custom_theme.dart';

void main() async {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const theme = CustomTheme();

    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: theme.getThemeData(),
      darkTheme: theme.getThemeDataDark(),
      debugShowCheckedModeBanner: false,
      home: const Center(child: Text('Hello World!')),
    );
  }
}
