import 'package:afya_bee/features/auth/controllers/auth_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppControllers {
  AppControllers._();

  static final AppControllers _instance = AppControllers._();

  static AppControllers get instance => _instance;

  List<SingleChildWidget> providers = [ChangeNotifierProvider(create: (_) => AuthController())];
}
