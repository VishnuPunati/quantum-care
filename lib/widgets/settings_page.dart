import 'package:flutter/material.dart';
import 'package:quantum_care/screens/developers_page.dart';
import 'package:quantum_care/screens/login_page.dart';
import 'package:quantum_care/screens/account_info_page.dart';

class SettingsPage extends StatelessWidget {
  final String name;
  final String email;

  const SettingsPage({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9F8),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xFFF4F9F8),
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1E3A3A),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _settingsTile(
            icon: Icons.person_outline,
            title: "Account Information",
            subtitle: "View your account details",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AccountInfoPage(name: name, email: email),
                ),
              );
            },
          ),

          _settingsTile(
            icon: Icons.lock_outline,
            title: "Change Password",
            subtitle: "Update your login password",
            onTap: () {
              // TODO: Change password flow
            },
          ),

          _settingsTile(
            icon: Icons.code,
            title: "Developers",
            subtitle: "Meet the development team",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DevelopersPage()),
              );
            },
          ),

          _settingsTile(
            icon: Icons.info_outline,
            title: "About App",
            subtitle: "Quantum Care application details",
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "Quantum Care",
                applicationVersion: "1.0.0",
                applicationLegalese: "Quantum-powered Nutrition Intelligence",
              );
            },
          ),

          const SizedBox(height: 24),

          // Logout button
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.06), blurRadius: 20),
              ],
            ),
            child: ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFFEF4444)),
              title: const Text(
                "Logout",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFEF4444),
                ),
              ),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _settingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.06), blurRadius: 20),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF2FA4A9)),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E3A3A),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Color(0xFF6B7280)),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Color(0xFF6B7280),
        ),
        onTap: onTap,
      ),
    );
  }
}
