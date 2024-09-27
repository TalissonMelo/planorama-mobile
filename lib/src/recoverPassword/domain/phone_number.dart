class PhoneNumber {
  String email;

  PhoneNumber({
    required this.email,
  });

  static PhoneNumber fromMap(Map map) {
    return PhoneNumber(email: map['email']);
  }
}
