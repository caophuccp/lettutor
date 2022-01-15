import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static final shared = LocalStorageService._();
  LocalStorageService._();

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  late SharedPreferences sharedPreferences;

  Future<bool> setString({
    required LocalStorageKey key,
    required String value,
  }) {
    return sharedPreferences.setString(_localStorageKeys.map[key]!, value);
  }

  String? getString({required LocalStorageKey key}) {
    return sharedPreferences.getString(_localStorageKeys.map[key]!);
  }
}

enum LocalStorageKey { TOKENS }
final _localStorageKeys = EnumValues({
  LocalStorageKey.TOKENS: 'login_token',
});

class EnumValues<T> {
  Map<T, String> map;
  Map<String, T>? reverseMap;

  EnumValues(this.map);

  Map<String, T> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
