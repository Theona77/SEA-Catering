import 'package:cloud_firestore/cloud_firestore.dart';

class WishlistModel {
  final String id;
  final String productId;

  WishlistModel({required this.id, required this.productId});

  Map<String, dynamic> toJson() => {
    'productId': productId,
  };

  factory WishlistModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return WishlistModel(
      id: doc.id,
      productId: data['productId'] ?? '',
    );
  }
}
