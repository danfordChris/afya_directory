import 'package:afya_bee/services/env_helper.dart';
import 'package:afya_bee/services/preferences.dart';
import 'package:ipf_flutter_starter_pack/ipf_flutter_starter_pack.dart';

class APIManager extends BaseAPIManager {
  APIManager._() : super(_currentURL, _manager);

  static APIManager get instance => APIManager._();

  static final String _localURL = AppEnvironment.debug.url;
  static final String _currentURL = AppEnvironment.production.url;

  /// Example: {403: () async => print('Forbidden'), 429: () async => handleRateLimit()}
  static StarterAPIManagement get _manager {
    return StarterAPIManagement(authorization: _authorization);
  }

  static Future<Map<String, String>?>? get _authorization async {
    Preferences preferences = Preferences.instance;
    String? accessToken = await preferences.apiToken;
    String? refreshToken = await preferences.apiRefreshToken;
    // if (accessToken == null || refreshToken == null) return null;
    return {if (accessToken != null) "Authorization": "Bearer $accessToken", if (refreshToken != null) "Cookie": refreshToken};
  }

  @override
  Future<StarterAPIManagement>? get refreshOnUnauthorized async {
    AppUtility.log("Refreshing token...");
    // await ImbejuJwtService.newToken;
    return _manager;
  }
}
