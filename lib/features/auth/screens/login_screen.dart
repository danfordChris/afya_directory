import 'package:afya_bee/core/extensions/build_context_extension.dart';
import 'package:afya_bee/core/resources/images.dart';
import 'package:afya_bee/features/dashboard/screens/doctor_dashboard_screen.dart';
import 'package:afya_bee/shared/components/app_button.dart';
import 'package:afya_bee/shared/components/input_fields.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                    labelText: "Email",
                    hintText: "Enter your email or phone number",
                    variant: InputFieldVariant.standard,
                    onChanged: (value) {
                      // Handle email input change
                    },
                  ),
                  SizedBox(height: 12),
                  InputField(
                    labelText: "Password",
                    hintText: "Enter your password",
                    obscureText: true,
                    variant: InputFieldVariant.standard,
                    onChanged: (value) {
                      // Handle email input change
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Forgot Password?', style: context.bodyMedium.copyWith(color: context.colorScheme.primary)),
                    ),
                  ),
                ],
              ),
              Spacer(),

              Column(
                children: [
                  AppButton(
                    text: 'Log In',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const DoctorDashboardScreen()));
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
    );
  }
}
