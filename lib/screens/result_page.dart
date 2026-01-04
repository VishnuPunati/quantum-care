import 'package:flutter/material.dart';
import 'package:quantum_care/data/history_repository.dart';

enum MalnutritionStatus { normal, moderate, severe }

class ResultPage extends StatelessWidget {
  final String patientName;
  final MalnutritionStatus status;
  final double riskScore; // 0.0 – 100.0

  const ResultPage({
    super.key,
    required this.patientName,
    required this.status,
    required this.riskScore,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(centerTitle: true, title: const Text("Assessment Result")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _ResultHeader(
              name: patientName,
              status: status,
              riskScore: riskScore,
            ),

            const SizedBox(height: 24),

            Expanded(child: _RecommendationCard(status: status)),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text(
                  "Save to History",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  HistoryRepository().add(
                    HistoryRecord(
                      patientName: patientName,
                      riskScore: riskScore,
                      status: status,
                      date: DateTime.now(),
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Result saved to history")),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// =======================
/// RESULT HEADER
/// =======================
class _ResultHeader extends StatelessWidget {
  final String name;
  final MalnutritionStatus status;
  final double riskScore;

  const _ResultHeader({
    required this.name,
    required this.status,
    required this.riskScore,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = _statusColor(status, theme);
    final label = _statusLabel(status);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: theme.shadowColor.withOpacity(0.1), blurRadius: 20),
        ],
      ),
      child: Column(
        children: [
          Text("Patient: $name", style: theme.textTheme.bodyMedium),
          const SizedBox(height: 12),

          Text(
            label,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),

          const SizedBox(height: 16),

          _RiskIndicator(score: riskScore, color: color),

          const SizedBox(height: 8),

          Text(
            "${riskScore.toStringAsFixed(1)}% Risk",
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _statusLabel(MalnutritionStatus status) {
    switch (status) {
      case MalnutritionStatus.normal:
        return "Normal Nutrition";
      case MalnutritionStatus.moderate:
        return "Moderate Risk";
      case MalnutritionStatus.severe:
        return "Severe Malnutrition";
    }
  }

  Color _statusColor(MalnutritionStatus status, ThemeData theme) {
    switch (status) {
      case MalnutritionStatus.normal:
        return Colors.green;
      case MalnutritionStatus.moderate:
        return Colors.orange;
      case MalnutritionStatus.severe:
        return theme.colorScheme.error;
    }
  }
}

/// =======================
/// RISK INDICATOR BAR
/// =======================
class _RiskIndicator extends StatelessWidget {
  final double score;
  final Color color;

  const _RiskIndicator({required this.score, required this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: LinearProgressIndicator(
        value: score / 100,
        minHeight: 12,
        backgroundColor: Colors.grey.withOpacity(0.2),
        valueColor: AlwaysStoppedAnimation(color),
      ),
    );
  }
}

/// =======================
/// RECOMMENDATION CARD
/// =======================
class _RecommendationCard extends StatelessWidget {
  final MalnutritionStatus status;

  const _RecommendationCard({required this.status});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final recommendations = _getRecommendations(status);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: theme.shadowColor.withOpacity(0.1), blurRadius: 20),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recommendations",
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),

          ...recommendations.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 20,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(item, style: theme.textTheme.bodyMedium),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> _getRecommendations(MalnutritionStatus status) {
    switch (status) {
      case MalnutritionStatus.normal:
        return [
          "Maintain a balanced diet",
          "Continue regular health checkups",
          "Stay physically active",
        ];
      case MalnutritionStatus.moderate:
        return [
          "Increase protein and calorie intake",
          "Include vitamin-rich foods",
          "Consult a nutritionist",
        ];
      case MalnutritionStatus.severe:
        return [
          "Immediate medical consultation recommended",
          "Begin supervised nutritional therapy",
          "Regular monitoring of biomarkers",
        ];
    }
  }
}
