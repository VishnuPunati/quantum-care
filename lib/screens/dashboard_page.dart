import 'package:flutter/material.dart';
import 'package:quantum_care/widgets/biomarker_input.dart';
import 'package:quantum_care/widgets/theme_toggle.dart';
import 'package:quantum_care/screens/history_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,

        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Quantum Care",
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: const [
            ThemeToggle(), // 🌗 GLOBAL TOGGLE
          ],
        ),

        body: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              Text(
                "Welcome 👋",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),

              Text(
                "Start a new quantum-based health assessment",
                style: theme.textTheme.bodyMedium,
              ),

              const SizedBox(height: 25),

              // New Assessment Card
              _DashboardCard(
                icon: Icons.health_and_safety,
                title: "New Health Assessment",
                subtitle:
                    "Enter biomarker values to predict malnutrition risk using quantum models.",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const BiomarkerInput()),
                  );
                },
              ),

              const SizedBox(height: 16),

              // Reports Card
              _DashboardCard(
                icon: Icons.picture_as_pdf_outlined,
                title: "View Reports",
                subtitle: "Access previous nutrition assessment reports.",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HistoryPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// =======================
/// Reusable Dashboard Card
/// =======================
class _DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _DashboardCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 32, color: theme.colorScheme.primary),
            const SizedBox(height: 12),
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text(subtitle, style: theme.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
