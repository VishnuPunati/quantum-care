import 'package:flutter/material.dart';

class ThemeController {
  static final ValueNotifier<ThemeMode> notifier = ValueNotifier(
    ThemeMode.light,
  );

  static void toggle() {
    notifier.value = notifier.value == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
  }

  static bool isDark() {
    return notifier.value == ThemeMode.dark;
  }
}
