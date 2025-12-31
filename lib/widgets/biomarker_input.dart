import 'package:flutter/material.dart';

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

  void _predict() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);
  }

  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: const Color(0xFF8FAFB3)),
      filled: true,
      fillColor: const Color(0xFFF1F5F4),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9F8),
      appBar: AppBar(
        title: const Text(
          "Patient Details",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Color(0xFF1E3A3A),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFF4F9F8),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  "Enter patient biomarker values to predict malnutrition risk using quantum analysis.",
                  style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
                ),
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _nameController,
                validator: (v) =>
                    v == null || v.isEmpty ? "Patient name required" : null,
                decoration: _inputDecoration(
                  "Patient Name",
                  Icons.person_outline,
                ),
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _vitAController,
                keyboardType: TextInputType.number,
                validator: (v) =>
                    v == null || v.isEmpty ? "Vitamin A required" : null,
                decoration: _inputDecoration(
                  "Vitamin A (µg/dL)",
                  Icons.medical_services,
                ),
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _vitDController,
                keyboardType: TextInputType.number,
                validator: (v) =>
                    v == null || v.isEmpty ? "Vitamin D required" : null,
                decoration: _inputDecoration("Vitamin D (ng/mL)", Icons.sunny),
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _glucoseController,
                keyboardType: TextInputType.number,
                validator: (v) =>
                    v == null || v.isEmpty ? "Glucose required" : null,
                decoration: _inputDecoration(
                  "Glucose (mg/dL)",
                  Icons.bloodtype,
                ),
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _ironController,
                keyboardType: TextInputType.number,
                validator: (v) =>
                    v == null || v.isEmpty ? "Iron required" : null,
                decoration: _inputDecoration("Iron (µg/dL)", Icons.science),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFFF1F5F4),

                    backgroundColor: const Color(0xFF2FA4A9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: _isLoading ? null : _predict,
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        )
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
