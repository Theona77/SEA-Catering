import 'package:sea_catering/features/authentication/controllers/signup/signup_controller.dart';
import 'package:sea_catering/utils/constants/colors.dart';
import 'package:sea_catering/utils/constants/sizes.dart';
import 'package:sea_catering/utils/constants/text_strings.dart';
import 'package:sea_catering/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({
    super.key,
});

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(
                    () => Checkbox(
                        value: controller.privacyPolicy.value,
                        onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value),
            ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodySmall,
              children: [
                TextSpan(text: TTexts.iAgreeTo),
                TextSpan(
                  text: TTexts.privacyPolicy,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(text: TTexts.and),
                TextSpan(
                  text: TTexts.termsOfUse,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}