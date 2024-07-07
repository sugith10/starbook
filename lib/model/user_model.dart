import 'dart:convert';
import 'package:flutter/foundation.dart';

@immutable
class UserModel {
  final String userId;
  final String userName;
  final String email;
  const UserModel({
    required this.userId,
    required this.userName,
    required this.email,
  });

  UserModel copyWith({
    String? userId,
    String? userName,
    String? email,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'userName': userName,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      userName: map['userName'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserModel(userId: $userId, userName: $userName, email: $email)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.userName == userName &&
        other.email == email;
  }

  @override
  int get hashCode => userId.hashCode ^ userName.hashCode ^ email.hashCode;
}
