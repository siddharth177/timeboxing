import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeboxing/providers/auth_provider.dart';
import 'package:timeboxing/providers/theme_provider.dart';
import 'package:timeboxing/screens/authentication/auth.dart';
import 'package:timeboxing/screens/authentication/email_verification.dart';
import 'package:timeboxing/widgets/loading_widget.dart';

import 'Utilities/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        home: StreamBuilder(
            stream: firebaseAuthInstance.authStateChanges(),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                return EmailVerificationScreen();
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget();
              }
              return AuthScreen();
            }));
  }
}
