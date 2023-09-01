import 'package:mest/shared/core/services/auth/register_service.dart';

abstract class IRegisterService {
  Future<void> register(RegisterRequest request);
}
