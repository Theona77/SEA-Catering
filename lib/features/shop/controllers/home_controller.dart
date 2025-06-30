import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/repositories.authentication/user/user_model.dart';
import '../../../data/repositories.authentication/user/user_repository.dart';

class HomeController extends GetxController{
  static HomeController get instance => Get.find();

  final carousalCuurentIndex = 0.obs;

  void updatePageIndicator(index) {
    carousalCuurentIndex.value = index;
  }

  /// User data from Firestore
  final Rx<UserModel> user = UserModel.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final userData = await UserRepository.instance.getUser(userId);
      user.value = userData;
    } catch (e) {
      print('Failed to fetch user: $e');
    }
  }
}