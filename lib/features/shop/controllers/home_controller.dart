import 'package:get/get.dart';

class HomeController extends GetxController{
  static HomeController get instance => Get.find();

  final carousalCuurentIndex = 0.obs;

  void updatePageIndicator(index) {
    carousalCuurentIndex.value = index;
  }
}