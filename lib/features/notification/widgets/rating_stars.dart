import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    final stars = List.generate(5, (index) {
      final value = index + 1;
      if (rating >= value) {
        return const Icon(Icons.star, size: 14, color: Colors.amber);
      }
      if (rating >= value - 0.5) {
        return const Icon(Icons.star_half, size: 14, color: Colors.amber);
      }
      return const Icon(Icons.star_border, size: 14, color: Colors.amber);
    });

    return Row(mainAxisSize: MainAxisSize.min, children: stars);
  }
}
