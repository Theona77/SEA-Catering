import 'package:cloud_firestore/cloud_firestore.dart';

class RatingModel {
  final String id;
  final String productId;
  final String customerName;
  final String message;
  final double rating;
  final Timestamp createdAt;

  RatingModel({
    required this.id,
    required this.productId,
    required this.customerName,
    required this.message,
    required this.rating,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
    'productId': productId,
    'customerName': customerName,
    'message': message,
    'rating': rating,
    'createdAt': createdAt,
  };

  factory RatingModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return RatingModel(
      id: doc.id,
      productId: data['productId'] ?? '',
      customerName: data['customerName'] ?? '',
      message: data['message'] ?? '',
      rating: (data['rating'] as num?)?.toDouble() ?? 0.0,
      createdAt: data['createdAt'] ?? Timestamp.now(),
    );
  }
}
