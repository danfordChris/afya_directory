import 'package:afya_bee/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final Widget icon;
  final String title;
  final Widget content;
  final Widget? trailing;
  const InfoRow({super.key, required this.icon, required this.title, required this.content, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        icon,
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.bodyMedium.copyWith(fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.outline),
              ),
              const SizedBox(height: 6),
              content,
            ],
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}
