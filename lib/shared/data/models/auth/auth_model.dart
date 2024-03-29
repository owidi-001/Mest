import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mest/shared/data/models/user/user_model.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class LoginData with _$LoginData {
  const factory LoginData({
    required User user,
    required String token,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, Object?> json) =>
      _$LoginDataFromJson(json);
}
