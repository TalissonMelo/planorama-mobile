class CustomApiAdvice {
  final bool success;
  final dynamic data;
  final String? errorMessage;

  CustomApiAdvice({required this.success, this.data, this.errorMessage});
}
