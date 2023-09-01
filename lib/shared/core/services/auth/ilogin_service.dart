import 'package:mest/shared/core/services/auth/login_service.dart';

abstract class ILoginService {
  Future<void> login(LoginRequest request);
}
