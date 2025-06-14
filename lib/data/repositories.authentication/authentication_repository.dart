import 'package:appppppp/exception/firebase_exception.dart';
import 'package:appppppp/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:appppppp/features/authentication/screens/login/login.dart';
import 'package:appppppp/features/authentication/screens/onboarding.dart';
import 'package:appppppp/features/authentication/screens/signup/verify_email.dart';
import 'package:appppppp/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // Called from main.dart on app launch
  @override
  void onReady() {
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }

  // Function to show Relevant Screen
  void screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      // If the user is logged in
      if (user.emailVerified) {
        // If the user's email is verified navigate to the main Navigation Menu
        Get.offAll(() => const NavigationMenu());
      } else {
        // If the user's email is not verified, navigate to the VerifyEmailScreen
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
        // Local Storage
        deviceStorage.writeIfNull('isFirstTime', true);
        // Check id it's the first time launching the app
        deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen()) // Redirect to Login Screen if not the first time
        : Get.offAll(const OnBoardingScreen()); // Redirect to onBoarding Screen if its the first time
        }
  }

  /// [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception ('Something went wrong. Please try again');
    }
  }


  /// [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception ('Something went wrong. Please try again');
    }
  }

  /// [EmailVerification] - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception('Something went wrong. Please try again');
    }
  }
  /// [LogoutUSer] - valid for any authentication
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception('Something went wrong. Please try again');
    }
  }
}