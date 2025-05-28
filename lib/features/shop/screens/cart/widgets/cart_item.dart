import 'package:flutter/material.dart';

import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../common/widgets/texts/t_brand_title_with_verified_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';


class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        TRoundedImage(
          imageUrl: TImages.product1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),

        const SizedBox(width: TSizes.spaceBtwItems),

        /// Title, Price and Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleWithVerifiedIcon(title: 'Vegetable'),
              Flexible(child: TProductTitleText(title: 'Fresh Pakcoy', maxLines: 1,)),

              /// Attributes
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'Weight', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: '500gr', style: Theme.of(context).textTheme.bodyLarge),
                      ]
                  )
              )
            ],
          ),
        ),

      ],
    );
  }
}
