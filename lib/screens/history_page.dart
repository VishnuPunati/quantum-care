import 'package:flutter/material.dart';
import 'package:quantum_care/data/history_repository.dart';
import 'package:quantum_care/screens/result_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final history = HistoryRepository().records;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(centerTitle: true, title: const Text("History")),
      body: history.isEmpty
          ? Center(
              child: Text("No reports yet", style: theme.textTheme.bodyMedium),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: history.length,
              itemBuilder: (context, index) {
                final record = history[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ResultPage(
                          patientName: record.patientName,
                          riskScore: record.riskScore,
                          status: record.status,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.description_outlined,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                record.patientName,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${record.riskScore.toStringAsFixed(1)}% Risk",
                                style: theme.textTheme.bodyMedium,
                              ),
                              Text(
                                record.date.toLocal().toString().split(' ')[0],
                                style: theme.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
