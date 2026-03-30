import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class EucharistScreen extends StatefulWidget {
  const EucharistScreen({super.key});

  @override
  State<EucharistScreen> createState() => _EucharistScreenState();
}

class _EucharistScreenState extends State<EucharistScreen> {
  final _formKey = GlobalKey<FormState>();
  
  final _childNameController = TextEditingController();
  final _schoolController = TextEditingController();
  final _baptismDateController = TextEditingController();
  final _parishOfBaptismController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Holy Communion")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildSection(title: "Communicant Information", children: [
                TextFormField(
                  controller: _childNameController,
                  decoration: const InputDecoration(labelText: "Child's Full Name *", border: OutlineInputBorder()),
                  validator: (val) => val!.isEmpty ? "Required" : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _schoolController,
                  decoration: const InputDecoration(labelText: "School / Catechism Center *", border: OutlineInputBorder()),
                  validator: (val) => val!.isEmpty ? "Required" : null,
                ),
              ]),
              _buildSection(title: "Baptismal Details", children: [
                TextFormField(
                  controller: _baptismDateController,
                  decoration: const InputDecoration(labelText: "Date of Baptism", border: OutlineInputBorder(), suffixIcon: Icon(Icons.calendar_today)),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _parishOfBaptismController,
                  decoration: const InputDecoration(labelText: "Parish of Baptism *", border: OutlineInputBorder()),
                  validator: (val) => val!.isEmpty ? "Required" : null,
                ),
              ]),
              const SizedBox(height: 24),
              CustomButton(
                text: "Register for First Communion",
                onPressed: () {
                  if (_formKey.currentState!.validate()) { /* Submit Logic */ }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required List<Widget> children}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
          const SizedBox(height: 12),
          ...children
        ]),
      ),
    );
  }
}