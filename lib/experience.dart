import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sea_catering/utils/constants/image_strings.dart';

class ExperienceCarousel extends StatelessWidget {
  const ExperienceCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> foodCategories = [
      {"title": "Sign In", "image": TImages.signcar},
      {"title": "Order", "image": TImages.ordercar},
      {"title": "Customize", "image": TImages.customizecar},
      {"title": "Pay", "image": TImages.paycar},
      {"title": "Deliver", "image": TImages.delivercar},
      {"title": "Enjoy", "image": TImages.enjoycar},
      {"title": "Rate", "image": TImages.ratecar},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Practical Experience for Everyone!",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          "Navigation becomes easy with just a few clicks! Discover easy options for breakfast, lunch, dinner, dessert and everything in between.",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),

        CarouselSlider(
          options: CarouselOptions(
            height: 180,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16/9,
            viewportFraction: 0.6,
          ),
          items: foodCategories.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(item["image"]!, fit: BoxFit.cover),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Text(
                          item["title"]!,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
