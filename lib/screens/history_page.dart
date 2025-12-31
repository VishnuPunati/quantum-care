import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  // Dummy data (replace later with real data / API / DB)
  final List<Map<String, String>> reports = const [
    {
      "name": "Ravi Kumar",
      "date": "12 Sep 2025",
      "result": "Malnutrition Risk",
      "severity": "HIGH",
    },
    {
      "name": "Anita Sharma",
      "date": "10 Sep 2025",
      "result": "Normal",
      "severity": "NORMAL",
    },
  ];

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
          "History",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1E3A3A),
          ),
        ),
      ),
      body: reports.isEmpty
          ? const Center(
              child: Text(
                "No reports available",
                style: TextStyle(color: Color(0xFF6B7280), fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: reports.length,
              itemBuilder: (context, index) {
                final report = reports[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
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
                    children: [
                      // Icon
                      const Icon(
                        Icons.description_outlined,
                        size: 36,
                        color: Color(0xFF2FA4A9),
                      ),

                      const SizedBox(width: 16),

                      // Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              report["name"]!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1E3A3A),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              report["date"]!,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Result: ${report["result"]}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF1E3A3A),
                              ),
                            ),
                            Text(
                              "Severity: ${report["severity"]}",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1E3A3A),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Arrow
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Color(0xFF6B7280),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
