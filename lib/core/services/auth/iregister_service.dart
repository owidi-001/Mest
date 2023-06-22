import 'package:mest/core/services/auth/register_service.dart';

abstract class IRegisterService {
  Future<void> register(RegisterRequest request);
}
