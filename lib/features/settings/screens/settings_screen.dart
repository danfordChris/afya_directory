import 'package:afya_bee/core/extensions/build_context_extension.dart';
import 'package:afya_bee/features/auth/controllers/auth_controller.dart';
import 'package:afya_bee/features/auth/screens/login_screen.dart';
import 'package:afya_bee/features/settings/widgets/profile_card.dart';
import 'package:afya_bee/features/settings/widgets/settings_app_card.dart';
import 'package:afya_bee/shared/components/app_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Logout')),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;

    try {
      // Perform logout
      await context.read<AuthController>().logout();

      if (!context.mounted) return;

      // Navigate to login screen
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const LoginScreen()), (route) => false);
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logout failed: $e'), backgroundColor: context.colorScheme.error));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: context.titleLarge.copyWith(color: context.colorScheme.onSurface)),
        centerTitle: false,
        surfaceTintColor: context.colorScheme.surface,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 16,
                  children: [
                    ProfileCard(),
                    SettingsAppCard(
                      cardTitle: "PRACTICE SETTINGS",
                      settings: [
                        SettingsModel(title: "Weekly Schedule", icon: Icons.people_outline, onTap: () {}),
                        SettingsModel(title: "Work Experience", icon: Icons.people_outline, onTap: () {}),
                        SettingsModel(title: "Set Qualifications", icon: Icons.people_outline, onTap: () {}),
                        SettingsModel(title: "Manage Affiliations", icon: Icons.business, onTap: () {}),
                      ],
                    ),
                    SettingsAppCard(
                      cardTitle: "ACCOUNT",
                      settings: [
                        SettingsModel(title: "Notifications", icon: Icons.business, onTap: () {}),
                        SettingsModel(title: "Profile Statistics", icon: Icons.business, onTap: () {}),
                        SettingsModel(title: "Change Password", icon: Icons.people_outline, onTap: () {}),
                        // SettingsModel(
                        //   title: "Language",
                        //   icon: Icons.people_outline,
                        //   onTap: () {},
                        //   trailing: const Text("English", style: TextStyle(fontSize: 14, color: Colors.grey)),
                        // ),
                      ],
                    ),
                    SettingsAppCard(
                      cardTitle: "SUPPORT",
                      settings: [SettingsModel(title: "Help Center", icon: Icons.business, onTap: () {}, showExternalIcon: true)],
                    ),
                    const SizedBox(height: 16),
                    AppButton.destructive(text: "LogOut", onPressed: () => _handleLogout(context)),
                    TextButton(
                      onPressed: () {
                        // TODO: Implement delete account functionality
                      },
                      child: Text("Delete Account", style: context.bodyMedium, textAlign: TextAlign.center),
                    ),
                    const SizedBox(height: 16),

                    const Center(
                      child: Text("Version 2.1.0", style: TextStyle(color: Colors.grey, fontSize: 14)),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
