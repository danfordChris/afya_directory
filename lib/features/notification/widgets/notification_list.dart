import 'package:afya_bee/core/extensions/build_context_extension.dart';
import 'package:afya_bee/features/notification/models/message_details.dart';
import 'package:afya_bee/features/notification/models/notification_item.dart';
import 'package:afya_bee/features/notification/models/review_details.dart';
import 'package:afya_bee/features/notification/widgets/details_row.dart';
import 'package:afya_bee/features/notification/widgets/rating_detail_row.dart';
import 'package:afya_bee/features/notification/widgets/rating_stars.dart';
import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({required this.items, required this.type});

  final List<NotificationItem> items;
  final NotificationType type;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = items[index];
        return DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, 4))],
          ),
          child: ListTile(
            onTap: () => _showNotificationDetails(context, item, type),
            title: Text(item.title),
            subtitle: Text(item.subtitle),
            trailing: item.rating == null
                ? Text(item.time, style: context.textTheme.bodySmall)
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RatingStars(rating: item.rating ?? 0),
                      const SizedBox(height: 4),
                      Text(item.time, style: context.textTheme.bodySmall),
                    ],
                  ),
          ),
        );
      },
    );
  }

  void _showNotificationDetails(BuildContext context, NotificationItem item, NotificationType type) {
    if (type == NotificationType.message && item.messageDetails != null) {
      _showMessageDetailsBottomSheet(context, item.messageDetails!);
    } else if (type == NotificationType.review && item.reviewDetails != null) {
      _showReviewDetailsBottomSheet(context, item.reviewDetails!);
    }
  }

  void _showMessageDetailsBottomSheet(BuildContext context, MessageDetails details) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => Padding(
          padding: const EdgeInsets.all(24),
          child: ListView(
            controller: scrollController,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Message Details', style: context.textTheme.headlineSmall),
                  IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
                ],
              ),
              const SizedBox(height: 24),
              DetailRow(label: 'Name', value: details.name),
              const SizedBox(height: 16),
              DetailRow(label: 'Email', value: details.email),
              const SizedBox(height: 16),
              DetailRow(label: 'Phone', value: details.phone),
              const SizedBox(height: 24),
              Text('Message', style: context.textTheme.titleMedium),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(details.message, style: context.textTheme.bodyMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showReviewDetailsBottomSheet(BuildContext context, ReviewDetails details) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => Padding(
          padding: const EdgeInsets.all(24),
          child: ListView(
            controller: scrollController,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Review Details', style: context.textTheme.headlineSmall),
                  IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
                ],
              ),
              const SizedBox(height: 24),
              RatingDetailRow(label: 'Overall Rating', rating: details.overallRating),
              const SizedBox(height: 16),
              RatingDetailRow(label: 'Service Quality', rating: details.serviceQualityRating),
              const SizedBox(height: 16),
              RatingDetailRow(label: 'Facilities & Equipment', rating: details.facilitiesEquipmentRating),
              const SizedBox(height: 16),
              RatingDetailRow(label: 'Professional Competence', rating: details.professionalCompetenceRating),
              const SizedBox(height: 16),
              RatingDetailRow(label: 'Impact & Outcome', rating: details.impactOutcomeRating),
              const SizedBox(height: 16),
              RatingDetailRow(label: 'Communication', rating: details.communicationRating),
              const SizedBox(height: 24),
              // Text('Review', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              // const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Text(details.review, style: context.textTheme.bodyMedium),
                    Text('Submitted By : ${details.submittedBy}', style: context.textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
