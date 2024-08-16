class CodeRequest {
  String code;

  CodeRequest({
    required this.code,
  });

  Map<String, dynamic> toJson() {
    return {
      'code': code,
    };
  }
}
