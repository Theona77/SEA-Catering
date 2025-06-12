import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:appppppp/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({
    super.key,
    required this.selectedAddress,
    required this.name,
    required this.phone,
    required this.address,
  });

  final bool selectedAddress;
  final String name;
  final String phone;
  final String address;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(TSizes.md),
      backgroundColor:
      selectedAddress ? TColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
          ? TColors.darkerGrey
          : Colors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          if (selectedAddress)
            const Positioned(
              right: 5,
              top: 0,
              child: Icon(
                Iconsax.tick_circle5,
                color: TColors.black,
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: TSizes.sm / 2),
              Text(phone),
              const SizedBox(height: TSizes.sm / 2),
              Text(address),
            ],
          ),
        ],
      ),
    );
  }
}
