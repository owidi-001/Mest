import 'package:mest/shared/core/services/auth/ilogin_service.dart';

class LoginRequest {
  String email;
  String password;

  LoginRequest({required this.email, required this.password});
}

class LoginService implements ILoginService {
  @override
  Future<void> login(LoginRequest request) async {
    // TODO: implement login
    throw UnimplementedError();
  }
}
