import 'package:get/get.dart';

class OrderItem {
  final String id;
  final String title;
  final String brand;
  final String image;
  final double price;
  final int quantity;
  final DateTime orderDate;

  OrderItem({
    required this.id,
    required this.title,
    required this.brand,
    required this.image,
    required this.price,
    required this.quantity,
    required this.orderDate,
  });
}

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  var orderHistory = <OrderItem>[].obs;

  void addOrder(OrderItem item) {
    orderHistory.add(item);
    orderHistory.refresh();
  }

  void addOrders(List<OrderItem> items) {
    orderHistory.addAll(items);
    orderHistory.refresh();
  }

  void clearOrders() {
    orderHistory.clear();
    orderHistory.refresh();
  }
}
