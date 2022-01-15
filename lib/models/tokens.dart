import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/models/app_date.dart';

part 'tokens.g.dart';

@JsonSerializable()
class Tokens {
  final Token access;
  final Token? refresh;

  Tokens({
    required this.access,
    this.refresh,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);
  Map<String, dynamic> toJson() => _$TokensToJson(this);
}

@JsonSerializable()
class Token {
  final String token;

  @AppDateJsonConverter()
  final AppDate expires;

  Token({
    required this.token,
    required this.expires,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
