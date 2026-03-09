import 'package:afya_bee/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {
  const DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: context.colorScheme.onSurfaceVariant),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(child: Text(value, style: context.textTheme.bodyMedium)),
      ],
    );
  }
}
