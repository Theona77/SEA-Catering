import 'package:appppppp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../common/styles/spacing_styles.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo, Title & Sub-Title

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 150,
                    image: AssetImage(TImages.darkAppLogo),
                  ),
                  // Text(TTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: TSizes.sm),
                  // Text(TTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),


                ],
              ),

              //Form
              // Form(child: Column(
              //   children: [
              //     TextFormField(
              //       decoration: Input,
              //
              //     )
              //   ],
              //
              // ))
            ],

          ),
        ),
      )
    );
  }

}