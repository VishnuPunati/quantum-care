import 'package:flutter/material.dart';
import 'package:quantum_care/theme/theme_controller.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeController.notifier,
      builder: (context, mode, _) {
        final isDark = mode == ThemeMode.dark;

        return IconButton(
          tooltip: "Toggle Theme",
          icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          onPressed: ThemeController.toggle,
        );
      },
    );
  }
}
