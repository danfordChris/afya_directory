import 'package:afya_bee/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.05))],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              const CircleAvatar(radius: 32, backgroundImage: NetworkImage("https://randomuser.me/api/portraits/women/44.jpg")),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text("Dr. Sarah Jenkins", style: context.bodyLarge.copyWith(color: context.colorScheme.onSurface)),
                Text("Cardiologist", style: context.labelMedium.copyWith(color: context.colorScheme.primary)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: HugeIcon(icon: HugeIcons.strokeRoundedEdit01, color: context.colorScheme.primary, size: 18),
          ),
        ],
      ),
    );
  }
}
