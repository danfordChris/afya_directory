import 'package:afya_bee/features/auth/services/auth_service.dart';
import 'package:afya_bee/models/user_model.dart';
import 'package:afya_bee/repositories/user_repository.dart';
import 'package:afya_bee/services/database_manager.dart';
import 'package:afya_bee/services/session_manager.dart';
import 'package:ipf_flutter_starter_pack/ipf_flutter_starter_pack.dart';

class AuthController extends StarterChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login({required String emailOrUsername, required String password}) async {
    _setLoading(true);
    try {
      UserModel userData = UserModel(
        email: emailOrUsername.contains('@') ? emailOrUsername : null,
        username: emailOrUsername.contains('@') ? null : emailOrUsername,
        password: password,
      );
      UserModel user = await AuthService.login(user: userData);
      await UserRepository.instance.save(user);
    } catch (e, s) {
      AppUtility.log('Login failed: $e at $s');
      SessionManager.handleError(e);
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout() async {
    try {
      _setLoading(true);
      await SessionManager.instance.clearSession();
      DatabaseManager.instance.deleteAll;
      _setLoading(false);
    } catch (e) {
      AppUtility.log('Logout failed: $e');
      _setLoading(false);
      rethrow;
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
