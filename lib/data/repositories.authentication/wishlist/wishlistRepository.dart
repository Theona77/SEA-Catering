import 'package:appppppp/features/shop/models/wishlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class WishlistRepository extends GetxController {
  static WishlistRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  // Tambah ke wishlist
  Future<void> addToWishlist(String userId, String productId) async {
    await _db
        .collection('Users')
        .doc(userId)
        .collection('Wishlist')
        .add({'productId': productId});
  }

  // Hapus dari wishlist
  Future<void> removeFromWishlist(String userId, String wishlistId) async {
    await _db
        .collection('Users')
        .doc(userId)
        .collection('Wishlist')
        .doc(wishlistId)
        .delete();
  }

  // Ambil semua wishlist user
  Future<List<WishlistModel>> fetchWishlist(String userId) async {
    final snapshot = await _db
        .collection('Users')
        .doc(userId)
        .collection('Wishlist')
        .get();
    return snapshot.docs
        .map((doc) => WishlistModel.fromSnapshot(doc))
        .toList();
  }

  // Cek apakah suatu produk ada di wishlist user
  Future<bool> isInWishlist(String userId, String productId) async {
    final snapshot = await _db
        .collection('Users')
        .doc(userId)
        .collection('Wishlist')
        .where('productId', isEqualTo: productId)
        .get();
    return snapshot.docs.isNotEmpty;
  }
}
