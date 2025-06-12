import 'package:appppppp/data/repositories.authentication/user/user_model.dart' show UserModel;
import 'package:appppppp/exception/firebase_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception('Something went wrong. Please try again!');
    }
  }

  /// Function to fetch user details based on user ID
  Future<UserModel> getUser(String userId) async {
    try {
      final doc = await _db.collection("Users").doc(userId).get();
      return UserModel.fromSnapShot(doc);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code);
    } on PlatformException catch (e) {
      throw TPlatformException(e.code);
    } catch (e) {
      throw Exception('Failed to fetch user data: $e');
    }
  }
}
