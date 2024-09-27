class Member {
  String id;
  String phone;
  String email;
  String type;
  String nickname;

  Member({
    required this.id,
    required this.phone,
    required this.email,
    required this.type,
    required this.nickname,
  });
}

enum MemberType {
  creator,
  editor,
  viewer,
}
