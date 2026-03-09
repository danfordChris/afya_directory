import 'package:afya_bee/core/extensions/build_context_extension.dart';
import 'package:afya_bee/features/settings/widgets/profile_card.dart';
import 'package:afya_bee/features/settings/widgets/settings_app_card.dart';
import 'package:afya_bee/shared/components/app_button.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
                    AppButton.destructive(text: "LogOut", onPressed: () {}),
                    TextButton(
                      onPressed: () {},
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
