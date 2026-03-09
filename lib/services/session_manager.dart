import 'package:afya_bee/services/preferences.dart';
import 'package:afya_bee/shared/components/app_alert.dart';
import 'package:ipf_flutter_starter_pack/ipf_flutter_starter_pack.dart';

class SessionManager {
  SessionManager._();

  static final SessionManager _instance = SessionManager._();

  static SessionManager get instance => _instance;

  /// Clear user session
  Future<void> clearSession() async {
    Preferences.instance.remove(PrefKeys.apiToken);
    Preferences.instance.remove(PrefKeys.isLoggedIn);
    Preferences.instance.remove(PrefKeys.apiRefreshToken);
  }

  static void handleError(Object exception) {
    _handleError(exception);
  }

  static void showError(Object exception) {
    _handleError(exception);
  }

  static void _handleError(Object exception) {
    String formattedError = exception.toString().replaceAll("Exception: ", "");
    AppUtility.log(formattedError);
    AppAlert.show(message: formattedError, type: AlertType.error);
  }
}
