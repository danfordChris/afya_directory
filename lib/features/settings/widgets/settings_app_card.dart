import 'package:afya_bee/core/extensions/build_context_extension.dart';
import 'package:afya_bee/shared/components/app_card.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class SettingsAppCard extends StatelessWidget {
  final String cardTitle;
  final List<SettingsModel> settings;
  const SettingsAppCard({super.key, required this.cardTitle, required this.settings});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(cardTitle, style: context.bodyMedium.copyWith(color: context.colorScheme.outline)),
        const SizedBox(height: 8),
        AppCard(
          padding: EdgeInsets.zero,
          child: Column(
            spacing: 8,
            children: [
              for (int i = 0; i < settings.length; i++) ...[
                ListTile(
                  leading: settings[i].icon != null
                      ? CircleAvatar(backgroundColor: context.colorScheme.outlineVariant.withAlpha(120), child: Icon(settings[i].icon, size: 20))
                      : null,
                  title: Text(settings[i].title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  trailing: settings[i].showExternalIcon
                      ? const HugeIcon(icon: HugeIcons.strokeRoundedCustomerService01, size: 20)
                      : settings[i].trailing ?? const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, size: 22),
                  onTap: settings[i].onTap,
                ),
                if (i != settings.length - 1) Padding(padding: const EdgeInsets.symmetric(horizontal: 30), child: const Divider(height: 1)),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class SettingsModel {
  final String title;
  final IconData? icon;
  final Widget? trailing;
  final bool showExternalIcon;
  final VoidCallback onTap;

  SettingsModel({required this.title, this.icon, this.trailing, this.showExternalIcon = false, required this.onTap});
}
