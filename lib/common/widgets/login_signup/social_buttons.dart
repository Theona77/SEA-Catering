import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/image_strings.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialButton(TImages.google),
        const SizedBox(width: TSizes.spaceBtwItems),
        _socialButton(TImages.facebook),
        const SizedBox(width: TSizes.spaceBtwItems),
        _socialButton(TImages.apple),
      ],
    );
  }

  Widget _socialButton(String assetImage) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: TColors.accent),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Image.asset(
          assetImage,
          width: TSizes.iconMd,
          height: TSizes.iconMd,
        ),
      ),
    );
  }
}
