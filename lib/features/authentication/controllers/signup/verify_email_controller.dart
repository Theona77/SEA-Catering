import 'dart:async';
import 'package:sea_catering/common/widgets/loaders/loaders.dart';
import 'package:sea_catering/common/widgets/success_screen/success_screen.dart';
import 'package:sea_catering/data/repositories.authentication/authentication_repository.dart';
import 'package:sea_catering/utils/constants/image_strings.dart';
import 'package:sea_catering/utils/constants/text_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  late Timer _timer;

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  /// Send Email Verification Link
  Future<void> sendEmailVerification() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        TLoaders.errorSnackBar(
          title: 'User not found',
          message: 'Please log in again to verify your email.',
        );
        return;
      }

      await user.sendEmailVerification();

      TLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Please check your inbox and verify your email',
      );
    } on FirebaseAuthException catch (e) {
      debugPrint('FIREBASE ERROR: ${e.message}');
      TLoaders.errorSnackBar(
        title: 'Firebase Error',
        message: e.message ?? 'An error occurred. Please try again.',
      );
    } catch (e, stack) {
      debugPrint('GENERAL ERROR: $e');
      debugPrint('STACK TRACE: $stack');
      TLoaders.errorSnackBar(
        title: 'Something went wrong',
        message: 'Could not send email verification.',
      );
    }
  }

  /// Timer to Auto Redirect once email is verified
  void setTimerForAutoRedirect() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        debugPrint("Timer stopped: user is null");
        timer.cancel();
        return;
      }

      await user.reload();

      if (user.emailVerified) {
        timer.cancel();
        Get.off(() => SuccessScreen(
          image: TImages.animation3,
          title: TText.yourAccountCreatedTitle,
          subTitle: TText.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ));
      }
    });
  }

  /// Manually Check if Email is Verified
  Future<void> checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    await currentUser?.reload();

    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
        image: TImages.animation3,
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
