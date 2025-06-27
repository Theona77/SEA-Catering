import 'package:sea_catering/data/repositories.authentication/wishlist/wishlistRepository.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WishlistController extends GetxController {
  static WishlistController get instance => Get.find();

  RxSet<String> wishlistIds = <String>{}.obs;

  String get userId => FirebaseAuth.instance.currentUser!.uid;

  @override
  void onInit() {
    super.onInit();
    loadWishlist();
  }

  Future<void> loadWishlist() async {
    final items = await WishlistRepository.instance.fetchWishlist(userId);
    wishlistIds.value = items.map((e) => e.productId).toSet();
  }

  Future<void> toggleWishlist(String productId) async {
    if (wishlistIds.contains(productId)) {
      final items = await WishlistRepository.instance.fetchWishlist(userId);
      final itemToRemove = items.firstWhereOrNull((e) => e.productId == productId);
      if (itemToRemove != null) {
        await WishlistRepository.instance.removeFromWishlist(userId, itemToRemove.id);
        wishlistIds.remove(productId);
      }
    } else {
      await WishlistRepository.instance.addToWishlist(userId, productId);
      wishlistIds.add(productId);
    }
  }

  bool isInWishlist(String productId) {
    return wishlistIds.contains(productId);
  }
}
