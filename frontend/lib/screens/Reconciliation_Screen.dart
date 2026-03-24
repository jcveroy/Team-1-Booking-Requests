import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class ReconciliationScreen extends StatefulWidget {
  const ReconciliationScreen({super.key});

  @override
  State<ReconciliationScreen> createState() => _ReconciliationScreenState();
}

class _ReconciliationScreenState extends State<ReconciliationScreen> {
  String _confessionType = 'Regular';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sacrament of Reconciliation")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSection(title: "Confession Request", children: [
              const Text("The Sacrament of Penance is the method by which individual men and women may confess sins committed after baptism and have them absolved by a priest."),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _confessionType,
                decoration: const InputDecoration(labelText: "Type of Confession", border: OutlineInputBorder()),
                items: ['Regular', 'First Confession', 'Spiritual Direction']
                    .map((label) => DropdownMenuItem(value: label, child: Text(label)))
                    .toList(),
                onChanged: (val) => setState(() => _confessionType = val!),
              ),
            ]),
            _buildSection(title: "Schedule Note", children: [
              const ListTile(
                leading: Icon(Icons.info_outline, color: Colors.blue),
                title: Text("Regular Confession Hours"),
                subtitle: Text("Mon-Sat: 5:00 PM - 6:00 PM\nSundays: During all Masses"),
              ),
              const SizedBox(height: 12),
              const Text("For private confession appointments, the parish office will contact you after submission."),
            ]),
            const SizedBox(height: 24),
            CustomButton(
              text: "Request Appointment",
              onPressed: () { /* Submit Logic */ },
            ),
          ],
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