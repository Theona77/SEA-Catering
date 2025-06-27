import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FoodCarousel extends StatelessWidget {
  const FoodCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> foodCategories = [
      {"title": "Meat", "image": "assets/images/meat.jpg"},
      {"title": "Veggie", "image": "assets/images/veggie.jpg"},
      {"title": "Soup", "image": "assets/images/soup.jpg"},
      {"title": "Quick & Easy", "image": "assets/images/quick_easy.jpg"},
      {"title": "Snacks", "image": "assets/images/snacks.jpg"},
      {"title": "Drinks", "image": "assets/images/drinks.jpg"},
      {"title": "Family Friendly", "image": "assets/images/family_friendly.jpg"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "CHOOSE FROM OVER 100 FRESH FOODS EACH WEEK",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          "With 7 different meal preferences, we make it easy to find the perfect option for you.",
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
