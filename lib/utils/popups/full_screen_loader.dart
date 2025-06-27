import 'package:sea_catering/common/widgets/loaders/animation_loader.dart';
import 'package:sea_catering/utils/constants/colors.dart';
import 'package:sea_catering/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A utility class for managing a full-screen loading dialog
class TFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation
  /// This method doesn't return anything
  ///
  /// Parameters :
  /// - text : The text to be displayed in the loading dialog
  /// - animation : The lottie animation to be shown
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!, // Use Get.overlayContext for overlay dialogs
        barrierDismissible: false, // The dialog can't be dismissed by tapping outside it
        builder: (_) => PopScope(
          canPop: false, // Disable popping with the back button
          child: Container(
            color: THelperFunctions.isDarkMode(Get.context!) ? TColors.darkerGrey : TColors.white,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 250),
                    TAnimationLoaderWidget(text: text, animation: animation),
                  ],
                ),
              ),
            ),
          ),

        ),
    );
  }

  /// Stop the currently open loading dialog
  /// This method doesn't return anything
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); // Close the dialog using the navigator
  }
}