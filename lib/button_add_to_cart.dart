import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sea_catering/utils/constants/colors.dart';
import 'package:sea_catering/utils/constants/sizes.dart';

class TAddToCartButton extends StatefulWidget {
  final VoidCallback onAdd;

  const TAddToCartButton({super.key, required this.onAdd});

  @override
  State<TAddToCartButton> createState() => _TAddToCartButtonState();
}

class _TAddToCartButtonState extends State<TAddToCartButton> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          count++;
        });
        widget.onAdd();
      },
      child: Container(
        decoration: BoxDecoration(
          color: count > 0 ? Colors.green : Colors.black,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(TSizes.cardRadiusMd),
            bottomRight: Radius.circular(TSizes.productImageRadius),
          ),
        ),
        child: SizedBox(
          width: TSizes.iconLg * 1.2,
          height: TSizes.iconLg * 1.2,
          child: Center(
            child: count == 0
                ? const Icon(Iconsax.add, color: TColors.white)
                : Text(
              '$count',
              style: const TextStyle(
                color: TColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
