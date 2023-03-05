// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginData _$$_LoginDataFromJson(Map<String, dynamic> json) => _$_LoginData(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$$_LoginDataToJson(_$_LoginData instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };
