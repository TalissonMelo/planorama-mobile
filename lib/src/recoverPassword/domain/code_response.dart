class CodeResponse {
  bool isValid;
  String invalidCodeCause;
  String newCode;
  String email;

  CodeResponse({
    required this.isValid,
    required this.invalidCodeCause,
    required this.newCode,
    required this.email,
  });

  static CodeResponse fromMap(Map map) {
    return CodeResponse(
      isValid: map['isValid'],
      invalidCodeCause: map['invalidCodeCause'],
      newCode: map['newCode'],
      email: map['email'],
    );
  }
}
