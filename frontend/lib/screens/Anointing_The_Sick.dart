import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class AnointingTheSickScreen extends StatefulWidget {
  static const routeName = '/anointing-the-sick';

  const AnointingTheSickScreen({super.key});

  @override
  State<AnointingTheSickScreen> createState() => _AnointingTheSickScreenState();
}

class _AnointingTheSickScreenState extends State<AnointingTheSickScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for the fields you provided
  final _patientNameController = TextEditingController();
  final _locationController = TextEditingController();
  final _conditionController = TextEditingController();
  
  // Additional necessary controllers for contact
  final _contactPersonController = TextEditingController();
  final _contactPhoneController = TextEditingController();

  @override
  void dispose() {
    _patientNameController.dispose();
    _locationController.dispose();
    _conditionController.dispose();
    _contactPersonController.dispose();
    _contactPhoneController.dispose();
    super.dispose();
  }

  void _handleSubmission() {
    if (_formKey.currentState!.validate()) {
      // Logic to call your provider would go here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Anointing request submitted successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anointing of the Sick"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Urgent Notice (Standard for this sacrament)
              Card(
                color: Colors.red[50],
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Icon(Icons.priority_high, color: Colors.red),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "For urgent cases requiring immediate attention, please call the Parish office directly.",
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // The section you specifically requested
              _buildSection(
                title: "Patient Information",
                children: [
                  TextFormField(
                    controller: _patientNameController,
                    decoration: const InputDecoration(
                      labelText: "Patient Full Name *",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value!.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _locationController,
                    decoration: const InputDecoration(
                      labelText: "Location (Hospital Name / Home Address) *",
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 2,
                    validator: (value) => value!.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _conditionController,
                    decoration: const InputDecoration(
                      labelText: "Brief Patient Condition",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),

              _buildSection(
                title: "Requester Information",
                children: [
                  TextFormField(
                    controller: _contactPersonController,
                    decoration: const InputDecoration(
                      labelText: "Your Name (Relative/Guardian) *",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value!.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _contactPhoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Contact Phone Number *",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value!.isEmpty ? "Required" : null,
                  ),
                ],
              ),

              const SizedBox(height: 20),
              CustomButton(
                text: "Submit Request",
                onPressed: _handleSubmission,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget (matches your project's coding style)
  Widget _buildSection({required String title, required List<Widget> children}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold, 
                color: Colors.blue
              ),
            ),
            const SizedBox(height: 12),
            ...children
          ],
        ),
      ),
    );
  }
}