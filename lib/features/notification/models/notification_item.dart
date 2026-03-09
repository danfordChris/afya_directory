import 'package:afya_bee/features/notification/models/message_details.dart';
import 'package:afya_bee/features/notification/models/review_details.dart';

class NotificationItem {
  const NotificationItem({required this.title, required this.subtitle, required this.time, this.rating, this.messageDetails, this.reviewDetails});

  final String title;
  final String subtitle;
  final String time;
  final double? rating;
  final MessageDetails? messageDetails;
  final ReviewDetails? reviewDetails;
}

enum NotificationType { message, review }
