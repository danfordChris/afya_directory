import 'package:afya_bee/core/resources/images.dart';
import 'package:afya_bee/features/auth/controllers/auth_controller.dart';
import 'package:afya_bee/features/dashboard/screens/doctor_dashboard_screen.dart';
import 'package:afya_bee/shared/components/app_button.dart';
import 'package:afya_bee/shared/components/input_fields.dart';
import 'package:flutter/material.dart';
import 'package:ipf_flutter_starter_pack/ipf_flutter_starter_pack.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthController provider = context.stateWatch<AuthController>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  spacing: 8,
                  children: [
                    Hero(tag: 'auth_app_logo', child: Image.asset(Images.appLogo, width: 120, height: 120)),
                    Text(
                      'Afya Bee',
                      style: context.headlineMedium.copyWith(color: context.colorScheme.onSurface, fontWeight: FontWeight.bold),
                    ),
                    Text('Sign in to Manage Bookings', style: context.bodyLarge.copyWith(color: context.colorScheme.outline)),
                  ],
                ),
                SizedBox(height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputField(
                      controller: _emailController,
                      labelText: "Email",
                      hintText: "Enter your email or username",
                      keyboardType: TextInputType.emailAddress,
                      variant: InputFieldVariant.standard,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email or username';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12),
                    InputField(
                      controller: _passwordController,
                      labelText: "Password",
                      hintText: "Enter your password",
                      obscureText: true,
                      variant: InputFieldVariant.standard,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // TODO: Implement forgot password functionality
                        },
                        child: Text('Forgot Password?', style: context.bodyMedium.copyWith(color: context.colorScheme.primary)),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    AppButton(
                      text: provider.isLoading ? 'Logging In...' : 'Log In',
                      onPressed: () async {
                        if (provider.isLoading) return;
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        AuthController authController = context.stateRead<AuthController>();
                        await authController.login(emailOrUsername: _emailController.text.trim(), password: _passwordController.text);
                        if (!mounted) return;
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const DoctorDashboardScreen()));
                      },
                      backgroundColor: context.colorScheme.primary,
                      height: 55,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: context.bodyMedium.copyWith(color: context.colorScheme.outline),
                          children: [
                            TextSpan(
                              text: 'Contact IT Support',
                              style: context.bodyMedium.copyWith(color: context.colorScheme.primary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
