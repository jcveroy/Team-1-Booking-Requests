import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class FuneralMassScreen extends StatefulWidget {
  static const routeName = '/funeral-mass';

  const FuneralMassScreen({super.key});

  @override
  State<FuneralMassScreen> createState() => _FuneralMassScreenState();
}

class _FuneralMassScreenState extends State<FuneralMassScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Controllers
  final _deceasedNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _wakeAddressController = TextEditingController();
  final _contactPersonController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _deceasedNameController.dispose();
    _ageController.dispose();
    _wakeAddressController.dispose();
    _contactPersonController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Logic to send data to your Provider
      print("Funeral Mass Request Submitted");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Funeral Mass Booking"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSection(
                title: "Deceased Information",
                children: [
                  TextFormField(
                    controller: _deceasedNameController,
                    decoration: const InputDecoration(
                      labelText: "Full Name of the Deceased *",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value!.isEmpty ? "Enter deceased name" : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Age *",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value!.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _wakeAddressController,
                    decoration: const InputDecoration(
                      labelText: "Wake Address/Chapel *",
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 2,
                    validator: (value) => value!.isEmpty ? "Required" : null,
                  ),
                ],
              ),
              
              _buildSection(
                title: "Contact Person",
                children: [
                  TextFormField(
                    controller: _contactPersonController,
                    decoration: const InputDecoration(
                      labelText: "Family Representative Name *",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value!.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Contact Number *",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value!.isEmpty ? "Required" : null,
                  ),
                ],
              ),

              _buildSection(
                title: "Schedule & Requirements",
                children: [
                  const Text(
                    "Note: The Parish office will contact you immediately to coordinate the priest's schedule for the mass and interment.",
                    style: TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Logic for file picker
                    },
                    icon: const Icon(Icons.upload_file),
                    label: const Text("Upload Death Certificate *"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.black87,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
              
              // Using your CustomButton if available, or a standard ElevatedButton
              CustomButton(
                text: "Submit Request",
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Your signature helper widget
  Widget _buildSection({required String title, required List<Widget> children}) {
    return Card(
      elevation: 2,
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
                color: Colors.blue,
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