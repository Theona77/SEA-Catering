import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sea_catering/features/shop/screens/home/widgets/promo_slider.dart';

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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          height: 150,
                          image: AssetImage(
                            Theme.of(context).brightness == Brightness.dark
                                ? TImages.lightAppLogo  // use light logo in dark mode
                                : TImages.darkAppLogo,  // use dark logo in light mode
                          ),
                        ),
                        Text("SEA Catering", style: Theme.of(context).textTheme.headlineLarge!.apply(color: Colors.white)),
                        const SizedBox(height: 8),
                        Text("Healthy Meals, Anytime, Anywhere", style: Theme.of(context).textTheme.titleMedium!.apply(color: Colors.white)),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        Text(
                          "SEA Catering is your trusted customizable healthy meal service with delivery across Indonesia.",
                          style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),
                      ],
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

                      SizedBox(height: TSizes.spaceBtwSections),

                      /// --- Promo Slider ---
                      const SizedBox(height: TSizes.spaceBtwItems),
                      TPromoSlider(banners: [TImages.banner1, TImages.banner2, TImages.banner3, TImages.banner4, TImages.banner5]),
                      const SizedBox(height: TSizes.spaceBtwItems *2),



                      _buildFeatureCard(Icons.restaurant_menu, "Meal Customization", "Personalize your meals to fit your dietary needs."),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      TPromoSlider(banners: [TImages.banner1, TImages.banner2, TImages.banner3, TImages.banner4, TImages.banner5]),
                      const SizedBox(height: TSizes.spaceBtwItems),


                      _buildFeatureCard(Icons.delivery_dining, "Nationwide Delivery", "We deliver to major cities across Indonesia."),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      TPromoSlider(banners: [TImages.banner1, TImages.banner2, TImages.banner3, TImages.banner4, TImages.banner5]),
                      const SizedBox(height: TSizes.spaceBtwItems),


                      _buildFeatureCard(Icons.info_outline, "Nutritional Info", "Detailed nutritional information for every meal."),

                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: FoodCarousel(),
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
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Contact Manager'),
                    content: const Text('Manager: Brian\nPhone: 08123456789'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
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
