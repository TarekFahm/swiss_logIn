import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

User userFromJson(String str) {
  final jsonData = json.decode(str);
  return User.fromJson(jsonData);
}

String userToJson(User data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class User {
  String userId;
  String fullName;
  String email;
  String role;

  User({
    this.userId,
    this.fullName,
    this.email,
    this.role
  });

  factory User.fromJson(Map<String, dynamic> json) => new User(
        userId: json["userId"],
    fullName: json["fullName"],
    email: json["email"],
    role: json["role"]
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "fullName": fullName,
        "email": email,
        "role":role
      };

  factory User.fromDocument(DocumentSnapshot doc) {
    return User.fromJson(doc.data);
  }
}
