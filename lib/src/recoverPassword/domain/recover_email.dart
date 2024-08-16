class RecoverEmail {
  String email;

  RecoverEmail({
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
