class PhoneNumber {
  String phone;

  PhoneNumber({
    required this.phone,
  });

  static PhoneNumber fromMap(Map map) {
    return PhoneNumber(phone: map['phone']);
  }
}
