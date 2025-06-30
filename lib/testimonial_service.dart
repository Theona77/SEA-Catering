import 'package:cloud_firestore/cloud_firestore.dart';
import 'testimonial_model.dart';

Stream<List<Testimonial>> getTestimonials(String productId) {
  return FirebaseFirestore.instance
      .collection('testimonials')
      .where('productId', isEqualTo: productId)
      .snapshots()
      .map((snap) {
    final list = snap.docs.map((d) => Testimonial.fromDoc(d)).toList();

    // Sort descending by createdAt if exists, otherwise leave as-is
    list.sort((a, b) {
      final aTime = a.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0);
      final bTime = b.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0);
      return bTime.compareTo(aTime);
    });

    return list;
  });
}




Future<void> submitTestimonial({
  required String productId,
  required String customerName,
  required String message,
  required double rating,
}) async {
  await FirebaseFirestore.instance.collection('testimonials').add({
    'productId': productId,
    'customerName': customerName,
    'message': message,
    'rating': rating,
    'createdAt': FieldValue.serverTimestamp(),
  });
}

