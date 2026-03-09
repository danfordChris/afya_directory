import 'package:afya_bee/models/user_model.dart';
import 'package:afya_bee/services/api_manager.dart';
import 'package:afya_bee/services/preferences.dart';
import 'package:ipf_flutter_starter_pack/ipf_flutter_starter_pack.dart';

class _Endpoints {
  _Endpoints._();

  static const String login = "/user/login";
}

class AuthService {
  AuthService._();

  static Future<UserModel> login({required UserModel user}) async {
    APIManager apiManager = APIManager.instance;

    // Convert to URL-encoded format
    Map<String, dynamic> loginData = user.toJsonLogin;
    String body = loginData.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value.toString())}').join('&');

    APIResponse apiResponse = await apiManager.apiAuthPost(
      _Endpoints.login,
      body: body,
      headers: {"Content-Type": "application/x-www-form-urlencoded", "X-Api-Key": "b2bf8f93df72d97f529be2f53994b1c3", "accept": "application/json"},
    );
    apiResponse.raiseOnError();
    apiResponse.log();
    Map<String, dynamic> data = apiResponse.responseBody;

    // Check if login was successful
    if (data['status'] == 'success') {
      Preferences.instance.save(PrefKeys.isLoggedIn, true);

      // Save tokens if present in response
      if (data.containsKey('token')) {
        Preferences.instance.save(PrefKeys.apiToken, data['token']);
      }
      if (data.containsKey('refreshToken')) {
        Preferences.instance.save(PrefKeys.apiRefreshToken, data['refreshToken']);
      }

      // Return user data if present, otherwise return the user object passed in
      if (data.containsKey('user')) {
        return UserModel.fromJson(data['user']);
      } else {
        // If API doesn't return user data, return the user object with the credentials
        return user;
      }
    } else {
      throw Exception(data['message'] ?? 'Login failed');
    }
  }
}
