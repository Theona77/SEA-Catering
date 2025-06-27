import 'package:sea_catering/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.backgroundColor,
    this.color,
    this.onPressed,
    this.size = TSizes.lg,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? backgroundColor;
  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: backgroundColor != null
            ? backgroundColor!
            : THelperFunctions.isDarkMode(context)
            ? Colors.black.withOpacity(0.9)
            : TColors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(100),
        ),
        child: IconButton(onPressed: onPressed, icon: Icon(icon, color: color, size: size)),
    );
  }
}

