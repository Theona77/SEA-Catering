import 'package:appppppp/common/widgets/icon/t_circular_icon.dart';
import 'package:appppppp/features/authentication/controllers/cart/CartController.dart';
import 'package:appppppp/utils/constants/colors.dart';
import 'package:appppppp/utils/constants/sizes.dart';
import 'package:appppppp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  final String productId;
  final int quantity;

  const TProductQuantityWithAddRemoveButton({
    super.key,
    required this.productId,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final isDark = THelperFunctions.isDarkMode(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => cartController.decreaseQuantity(productId),
          child: TCircularIcon(
            icon: Iconsax.minus,
            width: 32,
            height: 32,
            size: TSizes.md,
            color: isDark ? TColors.white : TColors.black,
            backgroundColor: isDark ? TColors.darkerGrey : TColors.light,
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text('$quantity', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: TSizes.spaceBtwItems),
        GestureDetector(
          onTap: () => cartController.increaseQuantity(productId),
          child: const TCircularIcon(
            icon: Iconsax.add,
            width: 32,
            height: 32,
            size: TSizes.md,
            color: TColors.white,
            backgroundColor: TColors.primary,
          ),
        ),
      ],
    );
  }
}
