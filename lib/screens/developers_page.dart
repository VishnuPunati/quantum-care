import 'package:flutter/material.dart';

class DevelopersPage extends StatelessWidget {
  const DevelopersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F9F8),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF1E3A3A)),
        title: const Text(
          "Developers",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color(0xFF1E3A3A),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const DeveloperCard(
            name: "Vishnu Varun",
            email: "punativishnuvarun@gmail.com",
            role: "Flutter Developer",
          ),
          const DeveloperCard(
            name: "Harshini Reddy",
            email: "harshinireddy@gmail.com",
            role: "ML Developer",
          ),
          const DeveloperCard(
            name: "Hemalatha",
            email: "hemalatha@gmail.com",
            role: "UI/UX Designer",
          ),
          const DeveloperCard(
            name: "Vinay Narayana",
            email: "vinaynarayana@gmail.com",
            role: "Backend Developer",
          ),

          const SizedBox(height: 20),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(color: Color(0xFF6B7280), fontSize: 14),
              children: [
                TextSpan(
                  text: "This application was developed under the guidance of ",
                ),
                TextSpan(
                  text: "Dr. M. Naresh",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF1E3A3A),
                  ),
                ),
                TextSpan(text: "."),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.06), blurRadius: 20),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: const Color(0xFF2FA4A9).withOpacity(0.15),
            child: const Icon(Icons.person, color: Color(0xFF2FA4A9)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E3A3A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(role, style: const TextStyle(color: Color(0xFF6B7280))),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
