// ✅ subscription_screen.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iconsax/iconsax.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      return const Scaffold(
        body: Center(child: Text("You must be logged in to view subscriptions.")),
      );
    }

    final iconColor = Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: iconColor),
        title: const Text("My Subscriptions"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('subscriptions')
            .where('user_id', isEqualTo: userId)
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final subscriptions = snapshot.data?.docs ?? [];

          if (subscriptions.isEmpty) {
            return const Center(child: Text("You have no active subscriptions."));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: subscriptions.length,
            itemBuilder: (context, index) {
              final sub = subscriptions[index];
              final data = sub.data() as Map<String, dynamic>;
              final status = data['status'] ?? 'Unknown';
              final statusColor = status == "Active"
                  ? Colors.green
                  : status == "Paused"
                  ? Colors.orange
                  : Colors.red;

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Iconsax.bag_tick, size: 40, color: Colors.blue),
                      const SizedBox(height: 12),
                      Text(
                        data['plan'] ?? 'No Plan Selected',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text("Meal Types: ${List.from(data['mealTypes'] ?? []).join(', ')}"),
                      Text("Delivery Days: ${List.from(data['deliveryDays'] ?? []).join(', ')}"),
                      Text("Total Price: Rp ${data['totalPrice'] ?? 0}"),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Text("Status: "),
                          Chip(
                            label: Text(status),
                            backgroundColor: statusColor.withOpacity(0.2),
                            labelStyle: TextStyle(color: statusColor),
                          ),
                        ],
                      ),
                      if (status == 'Paused' && data['pause_start'] != null && data['pause_end'] != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "Paused from ${DateFormat.yMMMd().format(DateTime.parse(data['pause_start']))} "
                                "to ${DateFormat.yMMMd().format(DateTime.parse(data['pause_end']))}",
                            style: const TextStyle(color: Colors.orange),
                          ),
                        ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => _pauseSubscription(context, sub.id),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                              child: const Text("Pause"),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => _cancelSubscription(context, sub.id),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                              child: const Text("Cancel"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _pauseSubscription(BuildContext context, String subscriptionId) async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      await FirebaseFirestore.instance.collection('subscriptions').doc(subscriptionId).update({
        'pause_start': picked.start.toIso8601String(),
        'pause_end': picked.end.toIso8601String(),
        'status': 'Paused',
      });

      Get.snackbar("Paused", "Subscription is paused during selected dates", snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> _cancelSubscription(BuildContext context, String subscriptionId) async {
    final confirm = await Get.defaultDialog<bool>(
      title: "Cancel Subscription",
      middleText: "Are you sure you want to cancel this subscription?",
      confirm: TextButton(onPressed: () => Get.back(result: true), child: const Text("Yes")),
      cancel: TextButton(onPressed: () => Get.back(result: false), child: const Text("No")),
    );

    if (confirm == true) {
      await FirebaseFirestore.instance.collection('subscriptions').doc(subscriptionId).update({
        'status': 'Cancelled',
      });

      Get.snackbar("Cancelled", "Subscription cancelled", snackPosition: SnackPosition.BOTTOM);
    }
  }
}
