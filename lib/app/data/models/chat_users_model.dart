// ignore_for_file: non_constant_identifier_names

class ChatUsersModel {
  String id, userName, fullName, avatar;

  ChatUsersModel({
    required this.id,
    required this.avatar,
    required this.fullName,
    required this.userName,
  });

  // From JSON
  factory ChatUsersModel.fromJson(Map<String, dynamic> json) {
    return ChatUsersModel(
      id: json['_id'] as String,
      avatar: json['Avatar'] as String,
      fullName: json['Fullname'] as String,
      userName: json['Username'] as String,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'Avatar': avatar,
      'Fullname': fullName,
      'Username': userName,
    };
  }

  // CopyWith method
  ChatUsersModel copyWith({
    String? id,
    String? Avatar,
    String? Fullname,
    String? Username,
  }) {
    return ChatUsersModel(
      id: id ?? this.id,
      avatar: Avatar ?? avatar,
      fullName: Fullname ?? fullName,
      userName: Username ?? userName,
    );
  }

  // ToString method
  @override
  String toString() {
    return 'ChatUsersModel(_id: $id, Avatar: $avatar, Fullname: $fullName, Username: $userName)';
  }
}
