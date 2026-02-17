import 'package:afya_bee/core/extensions/build_context_extension.dart';
import 'package:afya_bee/core/resources/images.dart';
import 'package:afya_bee/shared/components/icon_container.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class DoctorDashboardScreen extends StatelessWidget {
  const DoctorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Doctor Dashboard')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(Images.appLogo), // Placeholder image
                  ),
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
                  IconContainer(
                    icon: HugeIcon(icon: HugeIcons.strokeRoundedMoreVertical, color: context.colorScheme.onSurfaceVariant, size: 20),
                    backgroundColor: context.colorScheme.surfaceVariant,
                    containerSize: 24,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text('Today\'s Appointments', style: context.titleMedium),
              SizedBox(height: 8),
              // Placeholder for appointments list
              Container(
                height: 150,
                decoration: BoxDecoration(color: context.colorScheme.surfaceVariant, borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text('No appointments for today', style: context.bodyMedium.copyWith(color: context.colorScheme.outline)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
