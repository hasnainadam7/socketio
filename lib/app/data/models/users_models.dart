class UsersModel {
  final String? id; // Now optional
  final String username;
  final String email;
  final String fullname;
  final String avatar;
  final String? coverImage;// Now optional
  final String role;
  final String? accessToken;// Now optional
  final List<String> watchHistory;
  final String? password;// Now optional

  UsersModel({
    this.id, // Optional now
    required this.username,
    required this.email,
    required this.fullname,
    required this.avatar,
    this.coverImage,
    this.role = "user",
    this.accessToken,
    this.watchHistory = const [],
    this.password,
  });

  factory UsersModel.fromMap(Map<String, dynamic> map) {
    return UsersModel(
      id: map['_id']?.toString(), // Convert ObjectId to String
      username: map['Username'] ?? '',
      email: map['Email'] ?? '',
      fullname: map['Fullname'] ?? '',
      avatar: map['Avatar'] ?? '',
      coverImage: map['CoverImage'],
      role: map['Role'] ?? 'user',
      accessToken: map['accessToken'] ?? '',
      watchHistory: List<String>.from(map['WatchHistory'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) '_id': id, // Only send _id if it exists
      'Username': username,
      'Email': email,
      'Fullname': fullname,
      'Avatar': avatar,
      'CoverImage': coverImage,
      'Role': role,
      'accessToken': accessToken,
      'WatchHistory': watchHistory,
      'Password': password
    };
  }

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, accessToken: $accessToken, fullname: $fullname, avatar: $avatar, coverImage: $coverImage, role: $role, watchHistory: $watchHistory)';
  }

  UsersModel copyWith(
      {String? id,
      String? username,
      String? email,
      String? fullname,
      String? avatar,
      String? coverImage,
      String? role,

      String? accessToken,
      List<String>? watchHistory,
      String? password}) {
    return UsersModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      fullname: fullname ?? this.fullname,
      avatar: avatar ?? this.avatar,
      coverImage: coverImage ?? this.coverImage,
      role: role ?? this.role,
      accessToken: accessToken ?? this.accessToken,
      watchHistory: watchHistory ?? this.watchHistory,
      password: password ?? this.password,
    );
  }
}
