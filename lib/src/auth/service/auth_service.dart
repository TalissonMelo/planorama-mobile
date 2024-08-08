import 'package:liberbox_mobile/src/auth/model/login.dart';
import 'package:liberbox_mobile/src/auth/model/user_login.dart';
import 'package:liberbox_mobile/src/auth/repository/auth_repository.dart';
import 'package:liberbox_mobile/src/auth/service/result/auth_result.dart';

class AuthService {
  final authRepository = AuthRepository();

  Future<AuthResult> execute(Login login) async {
    final result = await authRepository.signIn(login);

    try {
      UserLogin userLogin = UserLogin.fromMap(result.data);
      return AuthResult.success(userLogin);
    } catch (error) {
      return AuthResult.error(result.errorMessage ?? '');
    }
  }
}
