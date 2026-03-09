import 'package:afya_bee/core/extensions/build_context_extension.dart';
import 'package:afya_bee/core/resources/images.dart';
import 'package:afya_bee/features/notification/screens/notification_screen.dart';
import 'package:afya_bee/features/settings/screens/settings_screen.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen())),
          child: Row(
            children: [
              Stack(
                children: [
                  ClipOval(child: Image.asset(Images.appLogo, width: 48, height: 48, fit: BoxFit.cover)),
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
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dr. Smith', style: context.headlineSmall.copyWith(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      RatingBar.readOnly(size: 15, filledIcon: Icons.star, emptyIcon: Icons.star_border, initialRating: 4, maxRating: 5),
                      Text('(2 Reviews)', style: context.labelSmall.copyWith(color: context.colorScheme.primary)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            IconButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationScreen())),
              icon: HugeIcon(icon: HugeIcons.strokeRoundedNotification01, color: context.colorScheme.onSurfaceVariant, size: 30),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                child: const Text(
                  '5',
                  style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
