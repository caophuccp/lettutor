import 'package:json_annotation/json_annotation.dart';

part 'tokens.g.dart';

@JsonSerializable()
class Tokens {
  Token access;
  Token? refresh;

  Tokens({
    required this.access,
    this.refresh,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);
}

@JsonSerializable()
class Token {
  String? token;
  String? expires;

  Token({this.token, this.expires});

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
