import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({Key? key}) : super(key: key);

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  DateTimeRange? _selectedRange;
  int _newSubscriptions = 0;
  double _mrr = 0;
  int _reactivations = 0;
  int _activeSubscriptions = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _selectedRange = DateTimeRange(
      start: DateTime.now().subtract(const Duration(days: 30)),
      end: DateTime.now(),
    );
    _fetchMetrics();
  }

  Future<void> _fetchMetrics() async {
    setState(() => _isLoading = true);

    final subsRef = FirebaseFirestore.instance.collection('subscriptions');
    final start = _selectedRange!.start;
    final end = _selectedRange!.end;

    final subsSnapshot = await subsRef
        .where('timestamp', isGreaterThanOrEqualTo: start)
        .where('timestamp', isLessThanOrEqualTo: end)
        .get();

    int newSubs = 0;
    double mrr = 0;
    int reactivations = 0;
    int activeSubs = 0;

    final allSnapshot = await subsRef.get();

    for (var doc in subsSnapshot.docs) {
      final data = doc.data();
      if (data['status'] == 'Active') {
        mrr += (data['totalPrice'] ?? 0);
      }
      if (data['status'] == 'Active' && data['reactivated'] == true) {
        reactivations++;
      }
      newSubs++;
    }

    for (var doc in allSnapshot.docs) {
      final data = doc.data();
      if (data['status'] == 'Active') {
        activeSubs++;
      }
    }

    setState(() {
      _newSubscriptions = newSubs;
      _mrr = mrr;
      _reactivations = reactivations;
      _activeSubscriptions = activeSubs;
      _isLoading = false;
    });
  }

  Future<void> _pickDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
      initialDateRange: _selectedRange,
    );

    if (picked != null) {
      setState(() => _selectedRange = picked);
      _fetchMetrics();
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateText = "${DateFormat.yMMMd().format(_selectedRange!.start)} - "
        "${DateFormat.yMMMd().format(_selectedRange!.end)}";

    return Scaffold(
      appBar: AppBar(title: const Text("Admin Dashboard")),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextButton.icon(
              icon: const Icon(Icons.date_range),
              label: Text(dateText),
              onPressed: _pickDateRange,
            ),
            const SizedBox(height: 16),

            _buildMetricCard("New Subscriptions", _newSubscriptions.toString(), Colors.blue),
            _buildMetricCard("MRR (Rp)", _mrr.toStringAsFixed(0), Colors.green),
            _buildMetricCard("Reactivations", _reactivations.toString(), Colors.orange),
            _buildMetricCard("Active Subscriptions", _activeSubscriptions.toString(), Colors.purple),

            const SizedBox(height: 24),
            const Text("Subscription Growth", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 200, child: _DummyLineChart()),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title),
        trailing: Text(value, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

/// Dummy chart for Subscription Growth - Replace with real data logic if needed
class _DummyLineChart extends StatelessWidget {
  const _DummyLineChart();

  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
      titlesData: FlTitlesData(show: true),
      gridData: FlGridData(show: true),
      borderData: FlBorderData(show: true),
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(1, 20),
            FlSpot(2, 35),
            FlSpot(3, 50),
            FlSpot(4, 65),
            FlSpot(5, 80),
          ],
          isCurved: true,
          color: Colors.purple,
          belowBarData: BarAreaData(show: true, color: Colors.purple.withOpacity(0.2)),
        ),
      ],
    ));
  }
}
