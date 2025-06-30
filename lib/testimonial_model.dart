import 'package:cloud_firestore/cloud_firestore.dart';

class Testimonial {
  final String id;
  final String productId;
  final String customerName;
  final String message;
  final double rating;
  final DateTime? createdAt;

  Testimonial({
    required this.id,
    required this.productId,
    required this.customerName,
    required this.message,
    required this.rating,
    this.createdAt,
  });

  factory Testimonial.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Testimonial(
      id: doc.id,
      productId: data['productId'] ?? '',
      customerName: data['customerName'] ?? '',
      message: data['message'] ?? '',
      rating: (data['rating'] ?? 0).toDouble(),
      createdAt: (data['createdAt'] != null)
          ? (data['createdAt'] as Timestamp).toDate()
          : null,
    );
  }
}
