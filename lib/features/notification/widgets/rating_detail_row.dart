import 'package:afya_bee/core/extensions/build_context_extension.dart';
import 'package:afya_bee/features/notification/widgets/rating_stars.dart';
import 'package:flutter/material.dart';

class RatingDetailRow extends StatelessWidget {
  const RatingDetailRow({required this.label, required this.rating});

  final String label;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(label, style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
        ),
        const SizedBox(width: 16),
        RatingStars(rating: rating),
        const SizedBox(width: 8),
        Text(rating.toStringAsFixed(1), style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
