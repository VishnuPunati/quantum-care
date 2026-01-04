import 'package:flutter/material.dart';
import 'package:quantum_care/screens/dashboard_page.dart';
import 'package:quantum_care/screens/history_page.dart';
import 'package:quantum_care/widgets/settings_page.dart';

class BottomNavBar extends StatefulWidget {
  final String userName;
  final String userEmail;

  const BottomNavBar({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const DashboardPage(),
      const HistoryPage(),
      SettingsPage(name: widget.userName, email: widget.userEmail),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,

        // 🌗 Theme-aware colors
        backgroundColor: theme.cardColor,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: theme.textTheme.bodySmall?.color?.withOpacity(0.6),

        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),

        showUnselectedLabels: true,
        elevation: 10,

        onTap: (index) {
          if (_currentIndex == index) return;
          setState(() => _currentIndex = index);
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            activeIcon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
