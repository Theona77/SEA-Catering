import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../testimonial_service.dart';

class TestimonialFormScreen extends StatefulWidget {
  final String productId;

  const TestimonialFormScreen({super.key, required this.productId});

  @override
  State<TestimonialFormScreen> createState() => _TestimonialFormScreenState();
}

class _TestimonialFormScreenState extends State<TestimonialFormScreen> {
  double _rating = 0;
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isSubmitting = false;

  Future<void> _submitTestimonial() async {
    if (_rating == 0 || _nameController.text.isEmpty) {
      Get.snackbar('Error', 'Please provide a name and rating.');
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      await submitTestimonial(
        productId: widget.productId,
        customerName: _nameController.text,
        message: _messageController.text,
        rating: _rating,
      );

      Get.back();
      Get.snackbar('Thank you!', 'Your review has been submitted.');
    } catch (e) {
      Get.snackbar('Error', 'Failed to submit review.');
    }

    setState(() => _isSubmitting = false);
  }


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate This Product'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: dark ? Colors.white : Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          TextButton(
            onPressed: _isSubmitting ? null : _submitTestimonial,
            child: Text(
              'Post',
              style: TextStyle(color: TColors.primary),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Example product image & title (replace with real data if available)
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.image),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    'Product Name',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            const Text('Rate this product', style: TextStyle(fontSize: 16)),

            /// Star Rating Row
            Row(
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Iconsax.star5 : Iconsax.star,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1.0;
                    });
                  },
                );
              }),
            ),

            const SizedBox(height: 16),
            const Text('Your Name'),
            TextField(controller: _nameController),

            const SizedBox(height: 16),
            const Text('Describe your experience (optional)'),
            TextField(
              controller: _messageController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Share your thoughts...',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


