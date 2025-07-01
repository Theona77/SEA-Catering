import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../testimonial_model.dart';
import '../../../../../testimonial_service.dart';
import '../../../../../utils/constants/sizes.dart';

class ReviewSection extends StatelessWidget {
  final String productId;

  const ReviewSection({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Testimonial>>(
      stream: getTestimonials(productId),
      builder: (ctx, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final list = snap.data ?? [];
        if (list.isEmpty) return const Text('No testimonials yet.');

        double totalRating = 0;
        for (var t in list) {
          totalRating += t.rating;
        }
        double averageRating = totalRating / list.length;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              itemCount: list.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, i) {
                final t = list[i];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(t.customerName, style: const TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Row(
                                children: List.generate(5, (j) => Icon(
                                  j < t.rating ? Iconsax.star5 : Iconsax.star,
                                  color: Colors.amber,
                                  size: 16,
                                )),
                              ),
                              const SizedBox(height: 8),
                              Text(t.message),
                            ],
                          ),
                        ),
                        const CircleAvatar(
                          backgroundColor: Colors.deepPurple,
                          radius: 24,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),
            const Text("Ratings and reviews are verified and are from people who use the same type of service that you use."),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text("Overall Rating: ${averageRating.toStringAsFixed(1)}"),
            Row(
              children: List.generate(5, (index) => Icon(
                index < averageRating.round() ? Iconsax.star5 : Iconsax.star,
                color: Colors.amber,
              )),
            ),
          ],
        );
      },
    );
  }
}
