import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../data/repositories.authentication/user/user_model.dart';
import '../../../../data/repositories.authentication/user/user_repository.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late final UserRepository _userRepository;

  // Initialize with empty UserModel
  Rx<UserModel> user = UserModel.empty().obs;

  // Loading state
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    try {
      _userRepository = UserRepository.instance;
    } catch (e) {
      print("UserRepository not found, creating new instance");
      _userRepository = Get.put(UserRepository());
    }
    fetchUserData();
  }

  /// Fetch user data with proper null safety
  Future<void> fetchUserData() async {
    try {
      isLoading.value = true;

      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        print("No authenticated user found");
        user.value = UserModel.empty();
        return;
      }

      final uid = currentUser.uid;
      print("Fetching user data for UID: $uid");

      // Using repository for better error handling
      final userData = await _userRepository.getUser(uid);
      user.value = userData;

      print("User data loaded successfully: ${userData.fullName}");
    } catch (e) {
      print("Error fetching user: $e");
      // Ensure we always have a valid user model
      user.value = UserModel.empty();
    } finally {
      isLoading.value = false;
    }
  }

  /// Update user data
  Future<void> updateUser(UserModel updatedUser) async {
    try {
      isLoading.value = true;

      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        throw Exception("No authenticated user found");
      }

      // Update in Firestore
      await _userRepository.updateUser(updatedUser);

      // Update local state
      user.value = updatedUser;

      print("User updated successfully");
    } catch (e) {
      print("Error updating user: $e");
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  /// Refresh user data
  Future<void> refreshUserData() async {
    await fetchUserData();
  }

  /// Save new user data
  Future<void> saveUserData(UserModel newUser) async {
    try {
      isLoading.value = true;

      await _userRepository.saveUserRecord(newUser);
      user.value = newUser;

      print("User saved successfully");
    } catch (e) {
      print("Error saving user: $e");
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  /// Check if user is authenticated
  bool get isAuthenticated => _auth.currentUser != null;

  /// Get current user ID
  String get currentUserId => _auth.currentUser?.uid ?? '';

  /// Check if user data is empty
  bool get hasUserData => user.value.id.isNotEmpty;
}