import 'package:sea_catering/features/authentication/controllers/signup/signup_controller.dart';
import 'package:sea_catering/features/authentication/controllers/terms_condition_checkbox/terms_conditions_checkbox.dart';
import 'package:sea_catering/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:sea_catering/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';


class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final dark = THelperFunctions.isDarkMode(context);
    return Form(
      key : controller.signupFormKey,
      child: Column(
      children: [
        ///FIRST N LAST NAME
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.firstName,
                validator: (value) => TValidator.validateEmptyText('First name', value),
                expands: false,
                decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user)
                ),
              ),
            ),

            const SizedBox(width: TSizes.spaceBtwInputFields),

            Expanded(
              child: TextFormField(
                controller: controller.lastName,
                validator: (value) => TValidator.validateEmptyText('Last name', value),
                expands: false,
                decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user)
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwInputFields),

        /// Username
        TextFormField(
          controller: controller.username,
          validator: (value) => TValidator.validateEmptyText('Username', value),
          expands: false,
          decoration: const InputDecoration(
              labelText: TTexts.userName,
              prefixIcon: Icon(Iconsax.user_edit)
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),



        /// Email
        TextFormField(
          controller: controller.email,
          validator: (value) => TValidator.validateEmail(value),
          decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct)
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),


        /// Phone Number
        TextFormField(
          controller: controller.phoneNumber,
          validator: (value) => TValidator.validatePhoneNumber(value),
          decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call)
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),


        /// Password
        Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              obscureText: controller.hidePasswords.value,
              decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePasswords.value = !controller.hidePasswords.value,
                    icon: Icon(controller.hidePasswords.value ? Iconsax.eye_slash : Iconsax.eye),
                  )
              ),
            ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),

        /// Terms and Condition CheckBox
        const TTermsAndConditionCheckbox(),

        const SizedBox(height: TSizes.spaceBtwSections),
        /// Sign Up Button
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text(TTexts.createAccount)
            )
        ),
      ],
    ),
    );
  }
}