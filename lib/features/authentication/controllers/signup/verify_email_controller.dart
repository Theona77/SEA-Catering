import 'dart:async';
import 'package:appppppp/common/widgets/loaders/loaders.dart';
import 'package:appppppp/common/widgets/success_screen/success_screen.dart';
import 'package:appppppp/data/repositories.authentication/authentication_repository.data.dart';
import 'package:appppppp/utils/constants/image_strings.dart';
import 'package:appppppp/utils/constants/text_string.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification Link
  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Please check your inbox and verify your email',
      );
    } catch (e) {
      debugPrint('ERROR TYPE: ${e.runtimeType}');
      debugPrint('ERROR VALUE: $e');
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email verification
  void setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
          image: TImages.animation2,
          title: TText.yourAccountCreatedTitle,
          subTitle: TText.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ));
      }
    });
  }

  /// Manually Check if Email Verified
  Future<void> checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
        image: TImages.animation2,
        title: TText.yourAccountCreatedTitle,
        subTitle: TText.yourAccountCreatedSubTitle,
        onPressed: () => AuthenticationRepository.instance.screenRedirect(),
      ));
    } else {
      TLoaders.errorSnackBar(
        title: 'Email not verified',
        message: 'Please verify your email before continuing.',
      );
    }
  }
}
