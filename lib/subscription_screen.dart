import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iconsax/iconsax.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Map<String, dynamic>? subscription;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSubscription();
  }

  Future<void> fetchSubscription() async {
    final userId = auth.currentUser?.uid;
    if (userId == null) return;

    final snapshot = await firestore
        .collection('subscriptions')
        .where('user_id', isEqualTo: userId)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      setState(() {
        subscription = snapshot.docs.first.data();
        subscription!['id'] = snapshot.docs.first.id;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> pauseSubscription() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null && subscription != null) {
      await firestore.collection('subscriptions').doc(subscription!['id']).update({
        'pause_start': picked.start.toIso8601String(),
        'pause_end': picked.end.toIso8601String(),
        'status': 'Paused',
      });

      fetchSubscription();
      Get.snackbar("Subscription Paused", "No charges will apply during selected dates",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> cancelSubscription() async {
    final confirm = await Get.defaultDialog<bool>(
      title: "Cancel Subscription",
      middleText: "Are you sure you want to permanently cancel your subscription?",
      confirm: TextButton(onPressed: () => Get.back(result: true), child: const Text("Yes")),
      cancel: TextButton(onPressed: () => Get.back(result: false), child: const Text("No")),
    );

    if (confirm == true && subscription != null) {
      await firestore.collection('subscriptions').doc(subscription!['id']).update({
        'status': 'Cancelled',
      });

      fetchSubscription();
      Get.snackbar("Subscription Cancelled", "You can re-subscribe anytime",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black;

    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (subscription == null) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: iconColor),
          title: const Text("My Subscription"),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: const Center(child: Text("You have no active subscription.")),
      );
    }

    final statusColor = subscription!['status'] == "Active"
        ? Colors.green
        : subscription!['status'] == "Paused"
        ? Colors.orange
        : Colors.red;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: iconColor),
        title: const Text("My Subscription"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Iconsax.bag_tick, size: 50, color: Colors.blue),
                const SizedBox(height: 12),
                Text(
                  subscription!['plan'] ?? 'No Plan Selected',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text("Meal Types: ${List.from(subscription!['mealTypes'] ?? []).join(', ')}"),
                Text("Delivery Days: ${List.from(subscription!['deliveryDays'] ?? []).join(', ')}"),
                Text("Total Price: Rp ${subscription!['totalPrice'] ?? 0}"),
                const SizedBox(height: 12),

                Row(
                  children: [
                    const Text("Status: "),
                    Chip(
                      label: Text(subscription!['status'] ?? 'Unknown'),
                      backgroundColor: statusColor.withOpacity(0.2),
                      labelStyle: TextStyle(color: statusColor),
                    ),
                  ],
                ),

                if (subscription!['status'] == 'Paused' &&
                    subscription!['pause_start'] != null &&
                    subscription!['pause_end'] != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    "Paused from ${DateFormat.yMMMd().format(DateTime.parse(subscription!['pause_start']))} "
                        "to ${DateFormat.yMMMd().format(DateTime.parse(subscription!['pause_end']))}",
                    style: const TextStyle(color: Colors.orange),
                  ),
                ],

                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: pauseSubscription,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    child: const Text(
                      "Pause Subscription",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: cancelSubscription,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text(
                      "Cancel Subscription",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
