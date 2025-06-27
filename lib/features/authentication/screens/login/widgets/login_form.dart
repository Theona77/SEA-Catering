import 'package:sea_catering/features/authentication/controllers/login/login_controller.dart';
import 'package:sea_catering/features/authentication/screens/signup/signup.dart';
import 'package:sea_catering/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

import '../../password_configuration/forget_password.dart';


class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key,});

  @override
  Widget build(BuildContext context){
    final controller = Get.put(loginController());

    return Form(
      key : controller.loginFormKey,
      child: Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(
        children: [
          //Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: TTexts.email),

          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          //Password
          Obx(
                () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                  )
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields /2),

          //Remember me and forget password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Remember Me
              Row(
                children: [
                  Obx(() => Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value),
                  ),
                  const Text(TTexts.rememberMe),
                ],
              ),

              //Forget Password
              TextButton(
                onPressed: () => Get.to(() => const ForgetPassword()),
                child: Text(
                  TTexts.forgetPassword,
                ),
              ),
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwSections),

          //Sign In Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.emailAndPasswordSignIn(),
              style: ElevatedButton.styleFrom(
              ),
              child: Text(TTexts.signIn),
            ),
          ),


          const SizedBox(height: TSizes.spaceBtwItems),

          //Create Account Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Get.to(() => const SignupScreen()),
              style: OutlinedButton.styleFrom(
                // Optional: customize button border color etc here
              ),
              child: Builder(
                builder: (context) {
                  final isDark = Theme.of(context).brightness == Brightness.dark;
                  return Text(
                    TTexts.createAccount,
                    style: TextStyle(
                      color: isDark ? Colors.white : TColors.darkerBlue,
                    ),
                  );
                },
              ),
            ),
          ),

          // const SizedBox(height: TSizes.spaceBtwSections),
        ],
      ),
    ),);
  }
}