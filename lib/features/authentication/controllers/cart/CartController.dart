import 'package:get/get.dart';

class CartItem {
  final String id;
  final String title;
  final String brand;
  final String image;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.brand,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}

class CartController extends GetxController {
  static CartController get instance => Get.find();

  var cartItems = <String, CartItem>{}.obs;

  void addToCart(CartItem product) {
    if (product.quantity <= 0 || product.price <= 0) return;

    if (cartItems.containsKey(product.id)) {
      cartItems[product.id]!.quantity++;
    } else {
      cartItems[product.id] = product;
    }
    cartItems.refresh();
    update();
  }

  void removeFromCart(String id) {
    cartItems.remove(id);
    cartItems.refresh();
    update();
  }

  void increaseQuantity(String id) {
    if (cartItems.containsKey(id)) {
      cartItems[id]!.quantity++;
      cartItems.refresh();
      update();
    }
  }

  void decreaseQuantity(String id) {
    if (cartItems.containsKey(id)) {
      if (cartItems[id]!.quantity > 1) {
        cartItems[id]!.quantity--;
      } else {
        cartItems.remove(id);
      }
      cartItems.refresh();
      update();
    }
  }

  void clearCart() {
    cartItems.clear();
    cartItems.refresh();
    update();
  }

  double get totalPrice => cartItems.values
      .fold(0, (sum, item) => sum + item.price * item.quantity);

  int get totalItems =>
      cartItems.values.fold(0, (sum, item) => sum + item.quantity);
}
