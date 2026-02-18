import 'package:afya_bee/core/extensions/build_context_extension.dart';
import 'package:afya_bee/core/resources/images.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(child: Image.asset(Images.appLogo, width: 48, height: 48, fit: BoxFit.cover)),
        SizedBox(width: 16),
        Column(
          children: [
            Text('Dr. Smith', style: context.headlineSmall.copyWith(fontWeight: FontWeight.bold)),
            RichText(
              text: TextSpan(
                text: 'Status: ',
                style: context.bodyMedium.copyWith(color: context.colorScheme.primary),
                children: [
                  TextSpan(
                    text: 'Online',
                    style: context.bodyMedium.copyWith(color: context.colorScheme.primary),
                  ),
                ],
              ),
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: HugeIcon(icon: HugeIcons.strokeRoundedNotification01, color: context.colorScheme.onSurfaceVariant, size: 30),
        ),
      ],
    );
  }
}
