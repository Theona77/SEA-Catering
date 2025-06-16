import 'package:appppppp/features/authentication/controllers/order/orderController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = OrderController.instance;

    return Obx(() {
      final orders = orderController.orderHistory;
      if (orders.isEmpty) {
        return const Center(child: Text("No orders yet."));
      }

      return ListView.separated(
        shrinkWrap: true,
        itemCount: orders.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (_, index) {
          final item = orders[index];
          return ListTile(
            leading: Image.asset(item.image, width: 50, height: 50),
              title: Text(item.title),
            subtitle: Text("Qty: ${item.quantity} • ${DateFormat('dd MMM yyyy – HH:mm').format(item.orderDate)}"),
            trailing: Text('Rp ${(item.price * item.quantity).toStringAsFixed(0)}'),
          );
        },
      );
    });
  }
}
