import 'package:flutter/material.dart';
import 'package:appppppp/features/shop/screens/cart/widgets/cart_item_tile.dart';
import 'package:appppppp/utils/constants/sizes.dart';
import 'package:appppppp/utils/constants/image_strings.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'image': TImages.product2,
        'brand': 'TaniSegar',
        'title': 'Kentang Segar',
        'price': 'Rp 19.000'
      },
      {
        'image': TImages.product1,
        'brand': 'SayurLokal',
        'title': 'Brokoli Hijau',
        'price': 'Rp 21.000'
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, __) =>
      const SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (_, index) {
        final item = items[index];
        return TCartItemTile(
          image: item['image']!,
          brand: item['brand']!,
          title: item['title']!,
          price: item['price']!,
          showAddRemoveButtons: showAddRemoveButtons,
        );
      },
    );
  }
}
