import 'package:afya_bee/core/extensions/build_context_extension.dart';
import 'package:afya_bee/core/theme/custom_colors.dart';
import 'package:afya_bee/shared/components/app_card.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class PatientInfo extends StatelessWidget {
  const PatientInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: context.customColors.warningContainer, borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "PENDING",
                  style: context.bodySmall.copyWith(color: Colors.orange.shade700, fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              Text(
                "ID : 12345",
                style: context.bodySmall.copyWith(color: context.colorScheme.outline, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text("Sarah Jenkins", style: context.headlineSmall.copyWith(fontWeight: FontWeight.bold)),
              const Spacer(),
              CircleAvatar(
                backgroundColor: context.customColors.successContainer,
                child: HugeIcon(icon: HugeIcons.strokeRoundedCall, color: context.colorScheme.primary, size: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
