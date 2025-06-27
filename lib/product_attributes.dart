import 'package:sea_catering/common/widgets/texts/product_title_text.dart';
import 'package:sea_catering/utils/constants/colors.dart';
import 'package:sea_catering/utils/constants/sizes.dart';
import 'package:sea_catering/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import 'common/widgets/chips/choice_chip.dart';
import 'common/widgets/texts/section_heading.dart';

class TProductAttributes extends StatelessWidget{
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        ///Desc
        TProductTitleText(
          title: 'This is the Decription of the product, max 5 lines',
          smallSize: true,
          maxLines: 5,
        ),

        const SizedBox(height: TSizes.spaceBtwItems),

        ///Sizes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Weights'),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: '100gr', selected: true, onSelected: (value){}),
                TChoiceChip(text: '500gr', selected: false, onSelected: (value){}),
                TChoiceChip(text: '1000gr', selected: false, onSelected: (value){}),

              ],
            )

        ],
        )

      ],
    );
  }


}

