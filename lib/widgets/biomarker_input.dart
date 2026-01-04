import 'package:flutter/material.dart';
import 'package:quantum_care/screens/result_page.dart';

class BiomarkerInput extends StatefulWidget {
  const BiomarkerInput({super.key});

  @override
  State<BiomarkerInput> createState() => _BiomarkerInputState();
}

class _BiomarkerInputState extends State<BiomarkerInput> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _vitAController = TextEditingController();
  final _vitDController = TextEditingController();
  final _glucoseController = TextEditingController();
  final _ironController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _vitAController.dispose();
    _vitDController.dispose();
    _glucoseController.dispose();
    _ironController.dispose();
    super.dispose();
  }

  void _predict() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);

    final patientName = _nameController.text.trim();

    final vitA = double.tryParse(_vitAController.text) ?? 0;
    final vitD = double.tryParse(_vitDController.text) ?? 0;
    final glucose = double.tryParse(_glucoseController.text) ?? 0;
    final iron = double.tryParse(_ironController.text) ?? 0;

    final riskScore = _calculateRiskScore(
      vitA: vitA,
      vitD: vitD,
      glucose: glucose,
      iron: iron,
    );

    final status = _calculateStatus(riskScore);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultPage(
          patientName: patientName,
          status: status,
          riskScore: riskScore,
        ),
      ),
    );
  }

  MalnutritionStatus _calculateStatus(double score) {
    if (score < 30) {
      return MalnutritionStatus.normal;
    } else if (score < 70) {
      return MalnutritionStatus.moderate;
    } else {
      return MalnutritionStatus.severe;
    }
  }

  double _calculateRiskScore({
    required double vitA,
    required double vitD,
    required double glucose,
    required double iron,
  }) {
    // ⚠️ TEMPORARY UI LOGIC (replace with ML later)
    double risk = 0;

    if (vitA < 30) risk += 20;
    if (vitD < 20) risk += 25;
    if (iron < 50) risk += 30;
    if (glucose < 70 || glucose > 140) risk += 25;

    return risk.clamp(0, 100);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Patient Details",
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Info Card
              Container(
                padding: const EdgeInsets.all(16),
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
                child: Text(
                  "Enter patient biomarker values to predict malnutrition risk using quantum analysis.",
                  style: theme.textTheme.bodyMedium,
                ),
              ),

              const SizedBox(height: 20),

              _InputField(
                controller: _nameController,
                hint: "Patient Name",
                icon: Icons.person_outline,
                validator: (v) =>
                    v == null || v.isEmpty ? "Patient name required" : null,
              ),

              const SizedBox(height: 16),

              _InputField(
                controller: _vitAController,
                hint: "Vitamin A (µg/dL)",
                icon: Icons.medical_services,
                keyboardType: TextInputType.number,
                validator: (v) =>
                    v == null || v.isEmpty ? "Vitamin A required" : null,
              ),

              const SizedBox(height: 16),

              _InputField(
                controller: _vitDController,
                hint: "Vitamin D (ng/mL)",
                icon: Icons.sunny,
                keyboardType: TextInputType.number,
                validator: (v) =>
                    v == null || v.isEmpty ? "Vitamin D required" : null,
              ),

              const SizedBox(height: 16),

              _InputField(
                controller: _glucoseController,
                hint: "Glucose (mg/dL)",
                icon: Icons.bloodtype,
                keyboardType: TextInputType.number,
                validator: (v) =>
                    v == null || v.isEmpty ? "Glucose required" : null,
              ),

              const SizedBox(height: 16),

              _InputField(
                controller: _ironController,
                hint: "Iron (µg/dL)",
                icon: Icons.science,
                keyboardType: TextInputType.number,
                validator: (v) =>
                    v == null || v.isEmpty ? "Iron required" : null,
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _predict,
                  child: _isLoading
                      ? const CircularProgressIndicator(strokeWidth: 2)
                      : const Text(
                          "Predict",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
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

/// =======================
/// Reusable Medical Input
/// =======================
class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const _InputField({
    required this.controller,
    required this.hint,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: theme.colorScheme.primary),
        filled: true,
        fillColor: theme.cardColor.withOpacity(0.6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
