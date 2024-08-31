class UserPermissions {
  String id;
  List<String> profiles;

  UserPermissions({
    required this.id,
    required this.profiles,
  });

  static UserPermissions fromMap(Map map) {
    return UserPermissions(
      id: map['id'],
      profiles: List<String>.from(
        map['profiles'],
      ),
    );
  }

  bool isValid() {
    return profiles.contains('ADMIN');
  }
}
