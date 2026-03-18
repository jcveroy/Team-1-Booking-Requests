import 'package:flutter/material.dart';

class MassIntentionScreen extends StatefulWidget {
  const MassIntentionScreen({super.key});

  @override
  State<MassIntentionScreen> createState() => _MassIntentionScreenState();
}

class _MassIntentionScreenState extends State<MassIntentionScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Controllers
  final TextEditingController _offeredByController = TextEditingController();
  final TextEditingController _intentionForController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  
  String _selectedType = 'Thanksgiving'; // Default selection

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Logic for submission
    }
  }

  Widget _buildSection({required String title, required List<Widget> children}) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mass Intention"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSection(title: "Intention Details", children: [
                DropdownButtonFormField<String>(
                  value: _selectedType,
                  decoration: const InputDecoration(labelText: "Intention Type *", border: OutlineInputBorder()),
                  items: ['Thanksgiving', 'Petition', 'Soul / Death Anniversary', 'Healing', 'Special Intention']
                      .map((label) => DropdownMenuItem(value: label, child: Text(label)))
                      .toList(),
                  onChanged: (value) => setState(() => _selectedType = value!),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _intentionForController,
                  decoration: const InputDecoration(labelText: "Name of Person / Intention *", border: OutlineInputBorder()),
                  validator: (value) => value!.isEmpty ? "Required" : null,
                ),
              ]),

              _buildSection(title: "Schedule & Offering", children: [
                TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  decoration: const InputDecoration(labelText: "Preferred Mass Date *", border: OutlineInputBorder(), suffixIcon: Icon(Icons.calendar_today)),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2027));
                    if (picked != null) _dateController.text = "${picked.year}-${picked.month}-${picked.day}";
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _offeredByController,
                  decoration: const InputDecoration(labelText: "Offered By (Name/Family) *", border: OutlineInputBorder()),
                  validator: (value) => value!.isEmpty ? "Required" : null,
                ),
              ]),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
                child: const Text("Submit Mass Intention"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}