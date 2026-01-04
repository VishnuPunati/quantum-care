import 'package:flutter/material.dart';

class DevelopersPage extends StatelessWidget {
  const DevelopersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: theme.textTheme.titleLarge?.color),
        title: Text(
          "Developers",
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          DeveloperCard(
            name: "Vishnu Varun",
            email: "punativishnuvarun@gmail.com",
            role: "Flutter Developer",
          ),
          DeveloperCard(
            name: "Harshini Reddy",
            email: "harshinireddy@gmail.com",
            role: "ML Developer",
          ),
          DeveloperCard(
            name: "Hemalatha",
            email: "hemalatha@gmail.com",
            role: "UI/UX Designer",
          ),
          DeveloperCard(
            name: "Vinay Narayana",
            email: "vinaynarayana@gmail.com",
            role: "Backend Developer",
          ),
          SizedBox(height: 20),
          _MentorText(),
        ],
      ),
    );
  }
}

/// =======================
/// Developer Card
/// =======================
class DeveloperCard extends StatelessWidget {
  final String name;
  final String role;
  final String email;

  const DeveloperCard({
    super.key,
    required this.name,
    required this.role,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: theme.shadowColor.withOpacity(0.1), blurRadius: 20),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: theme.colorScheme.primary.withOpacity(0.15),
            child: Icon(Icons.person, color: theme.colorScheme.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(role, style: theme.textTheme.bodySmall),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: theme.textTheme.bodySmall?.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// =======================
/// Mentor / Guidance Text
/// =======================
class _MentorText extends StatelessWidget {
  const _MentorText();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: theme.textTheme.bodySmall,
        children: [
          const TextSpan(
            text: "This application was developed under the guidance of ",
          ),
          TextSpan(
            text: "Dr. M. Naresh",
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(text: "."),
        ],
      ),
    );
  }
}
