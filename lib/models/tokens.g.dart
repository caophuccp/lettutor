// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tokens _$TokensFromJson(Map<String, dynamic> json) => Tokens(
      access: Token.fromJson(json['access'] as Map<String, dynamic>),
      refresh: json['refresh'] == null
          ? null
          : Token.fromJson(json['refresh'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokensToJson(Tokens instance) => <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
    };

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      token: json['token'] as String?,
      expires: json['expires'] as String?,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'token': instance.token,
      'expires': instance.expires,
    };
