import 'package:liberbox_mobile/src/auth/model/login.dart';
import 'package:liberbox_mobile/src/auth/repository/auth_repository.dart';

class AuthService {
  final authRepository = AuthRepository();

  Future<void> execute(Login login) async {
    await authRepository.signIn(login);
  }
}
