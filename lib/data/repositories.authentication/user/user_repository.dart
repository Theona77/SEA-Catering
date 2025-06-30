import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sea_catering/data/repositories.authentication/user/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      if (user.id.isEmpty) {
        throw Exception('User ID cannot be empty');
      }

      await _db.collection("Users").doc(user.id).set(user.toJson());
      print("User saved successfully: ${user.id}");
    } on FirebaseException catch (e) {
      print("Firebase error saving user: ${e.message}");
      throw Exception('Firebase error: ${e.message}');
    } on FormatException catch (e) {
      print("Format error saving user: $e");
      throw Exception('Format error occurred');
    } on PlatformException catch (e) {
      print("Platform error saving user: ${e.message}");
      throw Exception('Platform error: ${e.message}');
    } catch (e) {
      print("Unknown error saving user: $e");
      throw Exception('Something went wrong. Please try again!');
    }
  }

  /// Function to fetch user details based on user ID
  Future<UserModel> getUser(String userId) async {
    try {
      if (userId.isEmpty) {
        print("User ID is empty");
        return UserModel.empty();
      }

      print("Fetching user with ID: $userId");

      final doc = await _db.collection("Users").doc(userId).get();

      if (!doc.exists) {
        print("User document does not exist for ID: $userId");
        return UserModel.empty();
      }

      final userData = UserModel.fromSnapShot(doc);
      print("User fetched successfully: ${userData.fullName}");
      return userData;

    } on FirebaseException catch (e) {
      print("Firebase error fetching user: ${e.message}");
      throw Exception('Firebase error: ${e.message}');
    } on PlatformException catch (e) {
      print("Platform error fetching user: ${e.message}");
      throw Exception('Platform error: ${e.message}');
    } catch (e) {
      print("Unknown error fetching user: $e");
      throw Exception('Failed to fetch user data: $e');
    }
  }

  /// Function to update user data
  Future<void> updateUser(UserModel user) async {
    try {
      if (user.id.isEmpty) {
        throw Exception('User ID cannot be empty');
      }

      await _db.collection("Users").doc(user.id).update(user.toJson());
      print("User updated successfully: ${user.id}");
    } on FirebaseException catch (e) {
      print("Firebase error updating user: ${e.message}");
      throw Exception('Firebase error: ${e.message}');
    } catch (e) {
      print("Error updating user: $e");
      throw Exception('Failed to update user: $e');
    }
  }

  /// Function to check if user exists
  Future<bool> userExists(String userId) async {
    try {
      if (userId.isEmpty) return false;

      final doc = await _db.collection("Users").doc(userId).get();
      return doc.exists;
    } catch (e) {
      print("Error checking if user exists: $e");
      return false;
    }
  }
}