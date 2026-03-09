import 'package:ipf_flutter_starter_pack/ipf_flutter_starter_pack.dart';

class PrefKeys {
  PrefKeys._();

  static const String apiToken = "api_token";
  static const String isLoggedIn = "user_data";
  static const String apiRefreshToken = "api_refresh_token";
  static const String language = "language";
  static const String darkMode = "dark_mode";
}

class Preferences extends BasePreferences {
  Preferences._();
  static final Preferences _instance = Preferences._();
  static Preferences get instance => _instance;

  Future<String?> get apiToken async => await fetch<String?>(PrefKeys.apiToken);

  Future<String?> get apiRefreshToken async => await fetch<String?>(PrefKeys.apiRefreshToken);

  Future<String?> get language async => await fetch<String?>(PrefKeys.language);

  Future<bool?> get darkMode async => await fetch<bool?>(PrefKeys.darkMode);
  Future<bool?> get isLoggedIn async => await fetch<bool?>(PrefKeys.isLoggedIn);
}
