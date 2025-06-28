import 'package:sea_catering/common/widgets/loaders/loaders.dart';
import 'package:sea_catering/common/widgets/network/network_manager.dart';
import 'package:sea_catering/data/repositories.authentication/authentication_repository.dart';
import 'package:sea_catering/data/repositories.authentication/user/user_model.dart';
import 'package:sea_catering/data/repositories.authentication/user/user_repository.dart';
import 'package:sea_catering/exception/firebase_auth_exception.dart';
import 'package:sea_catering/features/authentication/screens/login/login.dart'; // <-- Ganti import ke LoginScreen
import 'package:sea_catering/features/authentication/screens/signup/verify_email.dart';
import 'package:sea_catering/utils/constants/image_strings.dart';
import 'package:sea_catering/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //// Variables
  final hidePasswords = true.obs; // Observable for hiding/showing password
  final privacyPolicy = true.obs;
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for first name input
  final phoneNumber = TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form key for form validation

  /// Signup
  void signup() async {
    try {
      // 1. Show Loading Animation
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information',
        TImages.mailSent,
      );

      // 2. Internet Check
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // 3. Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // 4. Privacy Policy Validation
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'To continue, you must accept our Privacy Policy.',
        );
        return;
      }

      // 5. Firebase Sign Up
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // 6. Save user to Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);


      // Remove Loader
      TFullScreenLoader.stopLoading();

      //S+ Show Success Message
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Account created! Please verify your email.',
      );

      // 9. Navigate to Email Verification Screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();

      // Optional: Hide technical error like malformed JSON
      final errorMessage = e.toString().contains('JsonReader') ?
      'Something went wrong. Please try again.' : e.toString();

      TLoaders.errorSnackBar(title: 'Error', message: errorMessage);
    }
  }
}
