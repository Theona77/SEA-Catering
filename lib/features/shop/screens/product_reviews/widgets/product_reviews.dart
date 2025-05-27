import 'package:appppppp/common/widgets/appbar/appbar.dart';
import 'package:appppppp/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:appppppp/features/shop/screens/product_reviews/widgets/rating_indicator.dart';
import 'package:appppppp/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:appppppp/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:appppppp/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- App bar
      appBar: const TAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Ratings and reviews are verified and are from people who use the same type of service that you use.",
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Overall Product Ratings
              TOverallProductRating(),
              TRatingBarIndicator(rating: 3.5,),
              Text("12,161", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// User Reviews List
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),




            ],
          ),
        ),
      ),
    );
  }
}
