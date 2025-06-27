import 'package:sea_catering/rounded_container.dart';
import 'package:sea_catering/utils/constants/colors.dart';
import 'package:sea_catering/utils/constants/enums.dart';
import 'package:sea_catering/utils/constants/image_strings.dart';
import 'package:sea_catering/utils/constants/sizes.dart';
import 'package:sea_catering/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../images/t_circular_image.dart';
import '../texts/t_brand_title_with_verified_icon.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.showBorder,
    this.onTap
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,

      /// Container Design
      child: TRoundedContainer(
        showBorder: showBorder,
        padding: const EdgeInsets.all(TSizes.sm),
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// --- Icon
            Flexible(
              child: TCircularImage(
                isNetworkImage: false,
                image: TImages.veggie_logo,
                backgroundColor: Colors.transparent,
                overlayColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),

            /// --- Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleWithVerifiedIcon(title: 'Vegetable', brandTextSize: TextSizes.large),
                  Text(
                    '256 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

