import 'package:quantum_care/screens/result_page.dart';

class HistoryRepository {
  // Singleton
  static final HistoryRepository _instance = HistoryRepository._internal();

  factory HistoryRepository() => _instance;

  HistoryRepository._internal();

  final List<HistoryRecord> _records = [];

  List<HistoryRecord> get records => List.unmodifiable(_records);

  void add(HistoryRecord record) {
    _records.insert(0, record); // newest first
  }

  void clear() {
    _records.clear();
  }
}

class HistoryRecord {
  final String patientName;
  final double riskScore;
  final MalnutritionStatus status;
  final DateTime date;

  HistoryRecord({
    required this.patientName,
    required this.riskScore,
    required this.status,
    required this.date,
  });
}
