
import 'package:appppppp/common/styles/spacing_styles.dart';
import 'package:appppppp/features/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  // final String image, title, subTitle;
  // final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions : [
          IconButton(onPressed: () =>Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
              image: const AssetImage(TImages.mailSent),
              width: THelperFunctions.screenWidth() * 10.0
              ),
              const SizedBox(height: TSizes.spaceBtwSections),


              /// Title and SubTitle
              Text(TTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(TTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwSections),

              //Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () => Get.to(() => const LoginScreen()), child: const Text(TTexts.done))),
              const SizedBox(height: TSizes.spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(onPressed: () => Get.to(() => const LoginScreen()), child: const Text(TTexts.resendEmail))),

    ],
          ),),
    ),);
  }
}