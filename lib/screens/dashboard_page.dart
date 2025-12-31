import 'package:flutter/material.dart';
import 'package:quantum_care/widgets/biomarker_input.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F9F8),
        appBar: AppBar(
          title: const Text(
            "Quantum Care",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 26,
              color: Color(0xFF1E3A3A),
            ),
          ),

          automaticallyImplyLeading: false,

          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0xFFF4F9F8),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              const Text(
                "Welcome 👋",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E3A3A),
                ),
              ),
              const SizedBox(height: 6),

              const Text(
                "Start a new quantum-based health assessment",
                style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
              ),

              const SizedBox(height: 25),

              // New Assessment Card
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BiomarkerInput()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.06),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.health_and_safety,
                        size: 32,
                        color: Color(0xFF2FA4A9),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "New Health Assessment",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1E3A3A),
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Enter biomarker values to predict malnutrition risk using quantum models.",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Reports Card
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.06),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.picture_as_pdf_outlined,
                        size: 26,
                        color: Color(0xFF2FA4A9),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "View Reports",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFF1E3A3A),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
