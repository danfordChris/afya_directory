import 'package:afya_bee/features/booking/widgets/info_row.dart';
import 'package:afya_bee/shared/components/app_card.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ipf_flutter_starter_pack/ipf_flutter_starter_pack.dart';

class BookingInformation extends StatelessWidget {
  const BookingInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Booking Information", style: context.titleMedium.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),

          InfoRow(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedCalendar01),
            title: "Time",
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tue, Oct 24, 2023", style: context.bodyMedium.copyWith(color: context.colorScheme.onSurface)),
                SizedBox(height: 4),
                Text("10:00 AM - 10:30 AM", style: context.bodyMedium.copyWith(color: context.colorScheme.primary)),
              ],
            ),
            trailing: CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: HugeIcon(icon: HugeIcons.strokeRoundedEdit01, color: context.colorScheme.primary, size: 18),
            ),
          ),

          const Divider(height: 30),

          InfoRow(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedStethoscope02),
            title: "Reason",
            content: const Text(
              "Patient reports experiencing mild fever and persistent dry cough for the last 3 days. No previous history of asthma.",
            ),
          ),
        ],
      ),
    );
  }
}
