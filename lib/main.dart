import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_workshop/core/custom_theme.dart';
import 'package:flutter_workshop/core/widgets/main_scaffold.dart';

void main() async {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
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
      home: const MainScaffold(),
    );
  }
}
