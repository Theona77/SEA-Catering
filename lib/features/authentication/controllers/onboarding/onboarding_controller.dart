import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/login/login.dart';

class OnBoardingController extends GetxController {
  final pageController = PageController();
  RxInt currentPageIndex = 0.obs;

  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
  }

  void skipToLastPage() {
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void nextPage() {
    final storage = GetStorage();

    if (currentPageIndex.value == 2) {
      if (kDebugMode) {
        print('==================== GET STORAGE Next Button ===================');
        print(storage.read('isFirstTime'));
      }

      storage.write('isFirstTime', false);
      Get.offAll(() => const LoginScreen());
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
