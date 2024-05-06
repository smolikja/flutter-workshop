import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_workshop/list_page/presentation/list_page_screen.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Transform.translate(
          offset: const Offset(10, 0),
          child: Text(
            'Rick & Morty',
            style: tt.headlineLarge?.copyWith(
              color: cs.onSurfaceVariant,
              fontWeight: FontWeight.bold,
            ),
          ),
        ).animate().fadeIn(delay: .8.seconds, duration: .7.seconds),
      ),
      body: const ListPageScreen(),
    );
  }
}
