import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  DateTimeRange? _selectedRange;
  int _newSubs = 0;
  int _reactivations = 0;
  double _mrr = 0;
  int _activeSubs = 0;

  Future<void> _fetchData() async {
    if (_selectedRange == null) return;

    final start = _selectedRange!.start;
    final end = _selectedRange!.end;

    final firestore = FirebaseFirestore.instance;

    // New Subscriptions
    final newSubsSnap = await firestore.collection('subscriptions')
        .where('timestamp', isGreaterThanOrEqualTo: start)
        .where('timestamp', isLessThanOrEqualTo: end)
        .get();
    setState(() => _newSubs = newSubsSnap.docs.length);

    // Reactivations
    final reactivationSnap = await firestore.collection('subscriptions')
        .where('reactivated_at', isGreaterThanOrEqualTo: start)
        .where('reactivated_at', isLessThanOrEqualTo: end)
        .get();
    setState(() => _reactivations = reactivationSnap.docs.length);

    // MRR
    final activeSnap = await firestore.collection('subscriptions')
        .where('status', isEqualTo: 'Active')
        .get();
    double totalRevenue = 0;
    for (var doc in activeSnap.docs) {
      final data = doc.data();
      final ts = (data['timestamp'] as Timestamp).toDate();
      if (ts.isAfter(start) && ts.isBefore(end)) {
        totalRevenue += (data['totalPrice'] ?? 0).toDouble();
      }
    }
    setState(() => _mrr = totalRevenue);

    // Active Subscriptions
    setState(() => _activeSubs = activeSnap.docs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final range = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2024),
                  lastDate: DateTime.now(),
                );
                if (range != null) {
                  setState(() => _selectedRange = range);
                  _fetchData();
                }
              },
              child: Text(_selectedRange == null
                  ? 'Select Date Range'
                  : '${_selectedRange!.start.toString().substring(0, 10)} - ${_selectedRange!.end.toString().substring(0, 10)}'),
            ),
            const SizedBox(height: 24),
            _buildMetricCard("New Subscriptions", _newSubs.toString()),
            _buildMetricCard("Reactivations", _reactivations.toString()),
            _buildMetricCard("Monthly Recurring Revenue (Rp)", _mrr.toStringAsFixed(0)),
            _buildMetricCard("Total Active Subscriptions", _activeSubs.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard(String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        trailing: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
