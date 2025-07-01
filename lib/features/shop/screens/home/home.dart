import 'package:flutter/material.dart';
import 'package:sea_catering/experience.dart';
import 'package:sea_catering/features/shop/screens/home/widgets/promo_slider.dart';

import '../../../../ai_chat.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../food_carousel.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Main content
          SingleChildScrollView(
            child: Column(
              children: [
                /// --- Header / Banner ---

                TPrimaryHeaderContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: SizedBox(
                      width: double.infinity,  // Ensures content stretches to full width
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            height: 150,
                            width: double.infinity,  // Optional: make logo stretch full width (or remove if you want to control logo size)
                            fit: BoxFit.contain,
                            image: AssetImage(
                              Theme.of(context).brightness == Brightness.dark
                                  ? TImages.lightAppLogo
                                  : TImages.darkAppLogo,
                            ),
                          ),
                          Center(
                            child: Text(
                              "SEA Catering",
                              style: Theme.of(context).textTheme.headlineLarge!.apply(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Center(
                            child: Text(
                              "Healthy Meals, Anytime, Anywhere",
                              style: Theme.of(context).textTheme.titleMedium!.apply(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: TSizes.spaceBtwSections),
                        ],
                      ),
                    ),
                  ),
                ),


                /// --- Features / Benefits ---
                Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TSectionHeading(title: "Why Choose SEA Catering?", showActionButton: false),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      Text(
                        "SEA Catering is your trusted, customizable healthy meal service that brings nutritious, delicious meals right to your doorstep. Whether you're focused on fitness, managing specific Dietary needs, or simply looking for convenient healthy meals, we've got you covered across Indonesia.",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      Image.asset(
                        TImages.indonesia,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        height: 300,
                      ),


                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: FoodCarousel(),
                      ),

                      const SizedBox(height: TSizes.spaceBtwSections),

                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "What's Inside of SEA Catering ?",
                              style: Theme.of(context).textTheme.titleLarge!.apply(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),

                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text("✓ ", style: TextStyle(color: Colors.white)),
                                Flexible(
                                  child: Text(
                                    "Fresh, quality produce",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 4),

                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text("✓ ", style: TextStyle(color: Colors.white)),
                                Flexible(
                                  child: Text(
                                    "Healthy Low Calorie Foods",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 4),

                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text("✓ ", style: TextStyle(color: Colors.white)),
                                Flexible(
                                  child: Text(
                                    "Top-notch proteins",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),

                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text("✓ ", style: TextStyle(color: Colors.white)),
                                Flexible(
                                  child: Text(
                                    "Less Sugar or Even Sugar Free!",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),

                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text("✓ ", style: TextStyle(color: Colors.white)),
                                Flexible(
                                  child: Text(
                                    "Mismatch based on your preference!",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),


                      const SizedBox(height: TSizes.spaceBtwSections),


                      /// --- Promo Slider ---
                      const SizedBox(height: TSizes.spaceBtwItems),
                      TPromoSlider(banners: [TImages.banner6, TImages.banner7, TImages.banner8]),
                      const SizedBox(height: TSizes.spaceBtwItems * 2),

                      _buildFeatureCard(Icons.restaurant_menu, "Meal Customization", "Personalize your meals to fit your Dietary needs."),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      TPromoSlider(banners: [TImages.banner1, TImages.banner9, TImages.banner10, TImages.banner11]),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      _buildFeatureCard(Icons.delivery_dining, "Nationwide Delivery", "We deliver to major cities across Indonesia."),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      TPromoSlider(banners: [TImages.banner13, TImages.banner12]),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      _buildFeatureCard(Icons.info_outline, "Nutritional Info", "Detailed nutritional information for every meal."),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: ExperienceCarousel(),
                      ),
                    ],
                  ),
                ),



                /// --- Contact Section ---
                Container(
                  width: double.infinity,
                  color: TColors.secondary.withOpacity(0.1),
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Contact Us", style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text("Manager: Brian", style: Theme.of(context).textTheme.bodyMedium),
                      Text("Phone: 08123456789", style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),

                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),

          /// --- Chat Button ---
          /// --- Chat Button ---
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (_) => const AIChatBox(),
                );
              },
              backgroundColor: TColors.secondary,
              child: const Icon(Icons.chat),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String title, String description) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: ListTile(
        leading: Icon(icon, size: 32, color: TColors.secondary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}
