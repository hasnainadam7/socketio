class Group {
  String id;
  String groupTitle;
  String groupIcon;
  List<GroupUser> groupUsers;
  List<Message> listOfMessages;
  DateTime createdAt;
  DateTime updatedAt;

  Group({
    required this.id,
    required this.groupTitle,
    required this.groupIcon,
    required this.groupUsers,
    required this.listOfMessages,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Group.fromMap(Map<String, dynamic> map, String documentId) {
    return Group(
      id: documentId,
      groupTitle: map['GroupTitle'] ?? '',
      groupIcon: map['GroupIcon'] ?? '',
      groupUsers: (map['GroupUsersDetails'] as List<dynamic>? ?? [])
          .map((user) => GroupUser.fromMap({
                'userID': user['_id'] ?? '',
                'isAdmin': user['isAdmin'] ?? false,
              }))
          .toList(),
      listOfMessages: map['latestMessage'] != null
          ? [Message.fromMap(map['latestMessage'])] // Wrap in a list
          : [],
      // listOfMessages: ,
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'])
          : DateTime.now(),
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'GroupTitle': groupTitle,
      'GroupIcon': groupIcon,
      'GroupUsers': groupUsers.map((user) => user.toMap()).toList(),
      'listOfMessages': listOfMessages.map((msg) => msg.toMap()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  Group copyWith({
    String? id,
    String? groupTitle,
    String? groupIcon,
    List<GroupUser>? groupUsers,
    List<Message>? listOfMessages,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Group(
      id: id ?? this.id,
      groupTitle: groupTitle ?? this.groupTitle,
      groupIcon: groupIcon ?? this.groupIcon,
      groupUsers: groupUsers ?? this.groupUsers,
      listOfMessages: listOfMessages ?? this.listOfMessages,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'Group(id: $id, groupTitle: $groupTitle, groupIcon: $groupIcon, groupUsers: $groupUsers, listOfMessages: $listOfMessages, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

class GroupUser {
  String userID;
  bool isAdmin;

  GroupUser({required this.userID, required this.isAdmin});

  factory GroupUser.fromMap(Map<String, dynamic> map) {
    return GroupUser(
      userID: map['userID'] ?? '',
      isAdmin: map['isAdmin'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'isAdmin': isAdmin,
    };
  }

  @override
  String toString() {
    return 'GroupUser(userID: $userID, isAdmin: $isAdmin)';
  }
}

class Message {
  String sender;
  String message;
  List<String> imageUrl;
  List<String> videoUrl;
  DateTime date;
  bool isEdited;
  bool isDeletedToAll;
  bool isDeletedOnlyMe;

  Message({
    required this.sender,
    required this.message,
    required this.imageUrl,
    required this.videoUrl,
    required this.date,
    required this.isEdited,
    required this.isDeletedToAll,
    required this.isDeletedOnlyMe,
  });

  factory Message.fromMap(Map<String, dynamic> map) {
    try {





      return Message(
        sender:   map['sender'] is Map<String, dynamic>
        ? map['sender']['_id'] ?? ''
          : map['sender'] ?? '',
        message: map['message'] ?? '',
        imageUrl: List<String>.from(map['imageUrl'] ?? []),
        videoUrl: List<String>.from(map['videoUrl'] ?? []),
        date: DateTime.parse(map['date']) ,
        isEdited: map['isEdited'] ?? false,
        isDeletedToAll: map['isDeletedToAll'] ?? false,
        isDeletedOnlyMe: map['isDeletedOnlyMe'] ?? false,
      );
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'sender': sender,
      'message': message,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
      'date': date,
      'isEdited': isEdited,
      'isDeletedToAll': isDeletedToAll,
      'isDeletedOnlyMe': isDeletedOnlyMe,
    };
  }

  Message copyWith({
    String? sender,
    String? message,
    List<String>? imageUrl,
    List<String>? videoUrl,
    DateTime? date,
    bool? isEdited,
    bool? isDeletedToAll,
    bool? isDeletedOnlyMe,
  }) {
    return Message(
      sender: sender ?? this.sender,
      message: message ?? this.message,
      imageUrl: imageUrl ?? this.imageUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      date: date ?? this.date,
      isEdited: isEdited ?? this.isEdited,
      isDeletedToAll: isDeletedToAll ?? this.isDeletedToAll,
      isDeletedOnlyMe: isDeletedOnlyMe ?? this.isDeletedOnlyMe,
    );
  }

  @override
  String toString() {
    return 'Message(sender: $sender, message: $message, imageUrl: $imageUrl, videoUrl: $videoUrl, date: $date, isEdited: $isEdited, isDeletedToAll: $isDeletedToAll, isDeletedOnlyMe: $isDeletedOnlyMe)';
  }
}
