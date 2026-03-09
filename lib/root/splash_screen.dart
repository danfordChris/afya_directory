import 'package:afya_bee/core/resources/images.dart';
import 'package:afya_bee/features/auth/screens/login_screen.dart';
import 'package:afya_bee/features/dashboard/screens/doctor_dashboard_screen.dart';
import 'package:afya_bee/services/preferences.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeAndNavigate();
  }

  Future<void> _initializeAndNavigate() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    Preferences prefs = Preferences.instance;
    bool isLoggedIn = await prefs.isLoggedIn ?? false;
    if (isLoggedIn) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const DoctorDashboardScreen()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(tag: 'auth_app_logo', child: Image.asset(Images.appLogo, width: 150)),
            const SizedBox(height: 24),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
