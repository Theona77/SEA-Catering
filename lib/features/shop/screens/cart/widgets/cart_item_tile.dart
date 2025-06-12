import 'package:flutter/material.dart';
import 'package:appppppp/common/widgets/images/t_rounded_image.dart';
import 'package:appppppp/common/widgets/texts/product_title_text.dart';
import 'package:appppppp/common/widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:appppppp/common/widgets/texts/product_price_text.dart';
import 'package:appppppp/features/shop/screens/cart/widgets/add_remove_button.dart';
import 'package:appppppp/utils/constants/sizes.dart';
import 'package:appppppp/utils/constants/image_strings.dart';
import 'package:appppppp/utils/constants/colors.dart';
import 'package:appppppp/utils/helpers/helper_functions.dart';

class TCartItemTile extends StatelessWidget {
  final String image;
  final String brand;
  final String title;
  final String price;
  final bool showAddRemoveButtons;

  const TCartItemTile({
    super.key,
    required this.image,
    required this.brand,
    required this.title,
    required this.price,
    this.showAddRemoveButtons = true,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        /// --- Product Detail Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// -- Product Image
            TRoundedImage(
              width: 60,
              height: 60,
              imageUrl: image,
              backgroundColor: dark ? Colors.black : TColors.light,
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            /// -- Product Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleWithVerifiedIcon(title: brand),
                  TProductTitleText(title: title),
                  TProductPriceText(price: price),
                ],
              ),
            ),
          ],
        ),

        /// -- Optional Add/Remove Buttons
        if (showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),
        if (showAddRemoveButtons)
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 70),
                  TProductQuantityWithAddRemoveButton(),
                ],
              ),
              TProductPriceText(price: 'Rp 18.000'),
            ],
          ),
      ],
    );
  }
}
