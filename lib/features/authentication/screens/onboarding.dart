import 'package:appppppp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:appppppp/utils/constants/image_strings.dart';
import 'package:appppppp/utils/constants/text_strings.dart';
import 'package:appppppp/utils/constants/sizes.dart';


class OnBoardingScreen extends StatelessWidget{
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [

          //Horizontal Scrollable Pages
          PageView(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        TImages.onBoardingImage1,
                        width: THelperFunctions.screenWidth() * 0.8,
                        height: THelperFunctions.screenHeight() * 0.4, // Adjust this
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      Text(
                        TTexts.onBoardingTitle1,
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      Text(
                        TTexts.onBoardingSubTitle1,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}

