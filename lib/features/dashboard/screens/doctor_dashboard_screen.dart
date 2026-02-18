import 'package:afya_bee/core/extensions/build_context_extension.dart';
import 'package:afya_bee/features/dashboard/widgets/appointment_card.dart';
import 'package:afya_bee/features/dashboard/widgets/dashboard_app_bar.dart';
import 'package:flutter/material.dart';

class DoctorDashboardScreen extends StatelessWidget {
  const DoctorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DashboardAppBar(),
              SizedBox(height: 16),
              Text('Today\'s Appointments', style: context.titleMedium),
              SizedBox(height: 8),
              AppointmentList(appointmentCount: 2),
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
