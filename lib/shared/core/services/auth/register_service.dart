import 'package:mest/shared/core/services/auth/iregister_service.dart';

class RegisterRequest {
  String name;
  String phone;

  RegisterRequest({
    required this.name,
    required this.phone,
  });
}

// hash password
class RegisterService implements IRegisterService {
  @override
  Future<void> register(RegisterRequest request) async {
    // TODO: implement register
  }
}
