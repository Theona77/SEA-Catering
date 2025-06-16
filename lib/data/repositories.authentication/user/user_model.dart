import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  String get fullName => '$firstName $lastName';
  String get formattedPhoneNo => phoneNumber.isNotEmpty ? phoneNumber : 'Not set';

  static List<String> nameParts(String fullName) => fullName.split(" ");

  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
    id: '',
    firstName: '',
    lastName: '',
    username: '',
    email: '',
    phoneNumber: '',
    profilePicture: '',
  );

  /// Convert model to JSON structure for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      'Email': email,
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  /// FIXED: Safe null handling in fromSnapShot
  factory UserModel.fromSnapShot(DocumentSnapshot<Map<String, dynamic>> document) {
    try {
      // Check if document exists and has data
      if (!document.exists) {
        print("Document does not exist for ID: ${document.id}");
        return UserModel.empty();
      }

      final data = document.data();

      // Double check for null data
      if (data == null) {
        print("Document data is null for ID: ${document.id}");
        return UserModel.empty();
      }

      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        username: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    } catch (e) {
      print("Error creating UserModel from snapshot: $e");
      return UserModel.empty();
    }
  }
}