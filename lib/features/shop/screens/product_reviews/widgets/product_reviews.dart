import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../rating_count.dart';
import '../../../../../testimonial_model.dart';
import '../../../../../testimonial_service.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductReviewScreen extends StatelessWidget {
  final String productId;
  const ProductReviewScreen({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionHeading(title: 'Testimonials', showActionButton: false),
              const SizedBox(height: 8),

              StreamBuilder<List<Testimonial>>(
                stream: getTestimonials(productId),
                builder: (ctx, snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final list = snap.data ?? [];
                  if (list.isEmpty) return const Text('No testimonials yet.');

                  return ListView.builder(
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
                  );
                },
              ),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Text("Ratings and reviews are verified and are from people who use the same type of service that you use."),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Text("Overall Rating: 4.5"),
              ReviewSection(productId: productId),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
