import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeboxing/providers/theme_provider.dart';
import 'package:timeboxing/screens/timeline_screen.dart';
import 'package:timeboxing/screens/no_disturb_landing_screen.dart';

import 'Utilities/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp(
      theme: kLightThemeData,
      darkTheme: kDarkThemeData,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      title: 'Time Boxing App',
      home: const Scaffold(
        body: NoDisturbLandingScreen(),
      ),
    );
  }
}
