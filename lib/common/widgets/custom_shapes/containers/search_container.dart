import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class TSearchContainer extends StatefulWidget {
  const TSearchContainer({
    super.key,
    required this.onSearchChanged,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
  });

  final IconData? icon;
  final bool showBackground, showBorder;
  final Function(String) onSearchChanged;

  @override
  State<TSearchContainer> createState() => _TSearchContainerState();
}

class _TSearchContainerState extends State<TSearchContainer> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      width: double.infinity, // Full width inside parent layout
      decoration: BoxDecoration(
        color: widget.showBackground
            ? (dark ? Colors.black : TColors.white)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
        border: widget.showBorder ? Border.all(color: Colors.grey) : null,
      ),
      child: Row(
        children: [
          const SizedBox(width: TSizes.md),
          Icon(widget.icon, color: Colors.blueGrey),
          const SizedBox(width: TSizes.spaceBtwItems),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Search product...',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
              style: TextStyle(color: dark ? Colors.white : Colors.black),
              onChanged: widget.onSearchChanged,
            ),
          ),
          const SizedBox(width: TSizes.md),
        ],
      ),
    );
  }
}
