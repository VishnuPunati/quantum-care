import 'package:flutter/material.dart';
import 'package:quantum_care/screens/developers_page.dart';
import 'package:quantum_care/screens/login_page.dart';
import 'package:quantum_care/screens/account_info_page.dart';
import 'package:quantum_care/widgets/theme_toggle.dart';

class SettingsPage extends StatelessWidget {
  final String name;
  final String email;

  const SettingsPage({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Settings",
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: const [
          ThemeToggle(), // GLOBAL TOGGLE
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _settingsTile(
            context,
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
            context,
            icon: Icons.lock_outline,
            title: "Change Password",
            subtitle: "Update your login password",
            onTap: () {
              // TODO: Implement change password
            },
          ),

          _settingsTile(
            context,
            icon: Icons.code,
            title: "Developers",
            subtitle: "Meet the development team",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DevelopersPage()),
              );
            },
          ),

          _settingsTile(
            context,
            icon: Icons.info_outline,
            title: "About App",
            subtitle: "Quantum Care application details",
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "Quantum Care",
                applicationVersion: "1.0.1",
                applicationLegalese: "Quantum-powered Nutrition Intelligence",
              );
            },
          ),

          const SizedBox(height: 24),

          // Logout
          Container(
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withOpacity(0.1),
                  blurRadius: 20,
                ),
              ],
            ),
            child: ListTile(
              leading: Icon(Icons.logout, color: theme.colorScheme.error),
              title: Text(
                "Logout",
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.error,
                ),
              ),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// =======================
  /// Reusable Settings Tile
  /// =======================
  Widget _settingsTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: theme.shadowColor.withOpacity(0.1), blurRadius: 20),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: theme.colorScheme.primary),
        title: Text(
          title,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(subtitle, style: theme.textTheme.bodySmall),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: theme.textTheme.bodySmall?.color,
        ),
        onTap: onTap,
      ),
    );
  }
}
