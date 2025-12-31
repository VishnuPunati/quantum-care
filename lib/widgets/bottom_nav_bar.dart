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
  late List<Widget> _pages;

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
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color(0xFFFFFFFF),
        selectedItemColor: const Color(0xFF111111),
        unselectedItemColor: const Color(0xFFBDBDBD),
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
