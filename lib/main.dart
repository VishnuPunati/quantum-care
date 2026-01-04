import 'package:flutter/material.dart';
import 'package:quantum_care/theme/app_theme.dart';
import 'package:quantum_care/theme/theme_controller.dart';
import 'package:quantum_care/screens/intro_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeController.notifier,
      builder: (context, themeMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Quantum Care',

          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,

          home: const IntroPage(),
        );
      },
    );
  }
}
