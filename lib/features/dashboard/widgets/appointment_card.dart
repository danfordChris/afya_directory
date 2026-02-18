import 'package:afya_bee/core/extensions/build_context_extension.dart';
import 'package:afya_bee/features/booking/screens/booking_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class AppointmentList extends StatelessWidget {
  final int appointmentCount;
  const AppointmentList({super.key, required this.appointmentCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          'MON, 5 JAN ($appointmentCount)',
          style: context.titleMedium.copyWith(color: context.colorScheme.outline, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...List.generate(appointmentCount, (index) => Padding(padding: const EdgeInsets.only(bottom: 12), child: const AppointmentCard())),
      ],
    );
  }
}

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BookingDetailScreen())),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: context.colorScheme.outlineVariant.withAlpha(120), width: 1),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Column(
                children: [
                  Text(
                    '09:32',
                    style: context.bodyLarge.copyWith(color: context.colorScheme.onSurface, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text('AM', style: context.bodySmall.copyWith(color: context.colorScheme.outline)),
                ],
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('John Doe', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    HugeIcon(icon: HugeIcons.strokeRoundedStethoscope02, size: 16, color: context.colorScheme.outline),
                    Text('Regency Hospital', style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.outline)),
                  ],
                ),
              ],
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: HugeIcon(icon: HugeIcons.strokeRoundedMoreVertical, size: 20, color: context.colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
