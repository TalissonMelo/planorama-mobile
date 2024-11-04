class UserProfileEdit {
  String? id;
  String? userId;
  String? email;
  String? phone;
  String? document;
  String? nickname;
  String? name;

  UserProfileEdit({
    this.id,
    this.userId,
    this.email,
    this.phone,
    this.document,
    this.nickname,
    this.name,
  });

  UserProfileEdit.fromMap(Map<String, dynamic> data) {
    id = data['id'] as String?;
    userId = data['userId'] as String?;
    email = data['email'] as String?;
    phone = data['phone'] as String?;
    document = data['document'] as String?;
    nickname = data['nickname'] as String?;
    name = data['name'] as String?;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'email': email,
      'phone': phone,
      'document': document,
      'nickname': nickname,
      'name': name,
    };
  }
}
