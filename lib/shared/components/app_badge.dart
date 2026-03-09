import 'dart:math';

import 'package:afya_bee/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

enum AppointmentStatus {
  confirmed,
  pending;

  Color get statusColor {
    switch (this) {
      case AppointmentStatus.confirmed:
        return Colors.green;
      case AppointmentStatus.pending:
        return Colors.orange;
    }
  }
}

class AppBadge extends StatelessWidget {
  const AppBadge({super.key});

  AppointmentStatus _getRandomStatus() {
    final random = Random();
    return AppointmentStatus.values[random.nextInt(AppointmentStatus.values.length)];
  }

  @override
  Widget build(BuildContext context) {
    AppointmentStatus status = _getRandomStatus();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      // decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(6)),
      child: Text(status.name, style: context.textTheme.labelSmall?.copyWith(color: status.statusColor)),
    );
  }
}
