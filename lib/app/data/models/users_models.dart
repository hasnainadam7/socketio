import 'dart:convert';

import 'package:flutter/foundation.dart';

class User {
  final String id;
  final String username;
  final String email;
  final String fullname;
  final String avatar;
  final String? coverImage;
  final String role;
  final String? refreshToken;
  final List<String> watchHistory;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.fullname,
    required this.avatar,
    this.coverImage,
    this.role = "user",
    this.refreshToken,
    this.watchHistory = const [],
  });

  User copyWith({
    String? id,
    String? username,
    String? email,
    String? fullname,
    String? avatar,
    String? coverImage,
    String? role,
    String? refreshToken,
    List<String>? watchHistory,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      fullname: fullname ?? this.fullname,
      avatar: avatar ?? this.avatar,
      coverImage: coverImage ?? this.coverImage,
      role: role ?? this.role,
      refreshToken: refreshToken ?? this.refreshToken,
      watchHistory: watchHistory ?? this.watchHistory,
    );
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      username: map['Username'] ?? '',
      email: map['Email'] ?? '',
      fullname: map['Fullname'] ?? '',
      avatar: map['Avatar'] ?? '',
      coverImage: map['CoverImage'],
      role: map['Role'] ?? 'user',
      refreshToken: map['RefreshToken'],
      watchHistory: List<String>.from(map['WatchHistory'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'Username': username,
      'Email': email,
      'Fullname': fullname,
      'Avatar': avatar,
      'CoverImage': coverImage,
      'Role': role,
      'RefreshToken': refreshToken,
      'WatchHistory': watchHistory,
    };
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, fullname: $fullname, avatar: $avatar, coverImage: $coverImage, role: $role, refreshToken: $refreshToken, watchHistory: $watchHistory)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User &&
        other.id == id &&
        other.username == username &&
        other.email == email &&
        other.fullname == fullname &&
        other.avatar == avatar &&
        other.coverImage == coverImage &&
        other.role == role &&
        other.refreshToken == refreshToken &&
        listEquals(other.watchHistory, watchHistory);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        email.hashCode ^
        fullname.hashCode ^
        avatar.hashCode ^
        coverImage.hashCode ^
        role.hashCode ^
        refreshToken.hashCode ^
        watchHistory.hashCode;
  }
}
