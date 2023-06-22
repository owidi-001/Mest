import 'package:mest/core/services/auth/iregister_service.dart';

class RegisterRequest {
  String name;
  String email;
  String phone;
  String password;

  RegisterRequest(
      {required this.name,
      required this.phone,
      required this.email,
      required this.password});
}

// hash password
class RegisterService implements IRegisterService {
  @override
  Future<void> register(RegisterRequest request) async {
    // TODO: implement register
  }
}
