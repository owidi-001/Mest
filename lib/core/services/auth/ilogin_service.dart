import 'package:mest/core/services/auth/login_service.dart';

abstract class ILoginService {
  Future<void> login(LoginRequest request);
}
