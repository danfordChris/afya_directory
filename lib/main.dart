import 'package:afya_bee/core/theme/app_theme.dart';
import 'package:afya_bee/root/splash_screen.dart';
import 'package:afya_bee/services/env_helper.dart';
import 'package:afya_bee/shared/controllers/app_controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  EnvHelper.instance.init();
  runApp(MultiProvider(providers: AppControllers.instance.providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.light,
        darkTheme: AppTheme.light,
        // themeMode: stateful.themeMode,
        home: const SplashScreen(),
      ),
    );
  }
}
