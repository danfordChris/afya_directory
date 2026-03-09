import 'package:afya_bee/features/notification/models/message_details.dart';
import 'package:afya_bee/features/notification/models/notification_item.dart';
import 'package:afya_bee/features/notification/models/review_details.dart';
import 'package:afya_bee/features/notification/widgets/notification_list.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
          bottom: const TabBar(
            tabs: [
              // Tab(text: 'Bookings'),
              Tab(text: 'Messages (5) '),
              Tab(text: 'Reviews (7)'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // _NotificationList(
            //   items: [
            //     _NotificationItem(title: 'Booking confirmed', subtitle: 'Your appointment is set for 10:30 AM.', time: '2m'),
            //     _NotificationItem(title: 'Upcoming visit', subtitle: 'Don\'t forget your booking tomorrow.', time: '1h'),
            //     _NotificationItem(title: 'Booking rescheduled', subtitle: 'Your booking moved to Friday.', time: '1d'),
            //   ],
            // ),
            NotificationList(
              type: NotificationType.message,
              items: [
                NotificationItem(
                  title: 'New message',
                  subtitle: 'Dr. Wanjala sent you a note.',
                  time: '5m',
                  messageDetails: MessageDetails(
                    name: 'Dr. Wanjala',
                    email: 'dr.wanjala@afyabee.com',
                    phone: '+254 712 345 678',
                    message: 'Hello, I wanted to follow up on your recent consultation. Please remember to take your medication as prescribed.',
                  ),
                ),
                NotificationItem(
                  title: 'Follow-up',
                  subtitle: 'Please share your latest symptoms.',
                  time: '3h',
                  messageDetails: MessageDetails(
                    name: 'Dr. Kamau',
                    email: 'dr.kamau@afyabee.com',
                    phone: '+254 723 456 789',
                    message:
                        'I hope you are feeling better. Could you please update me on your current symptoms and how you are responding to the treatment?',
                  ),
                ),
                NotificationItem(
                  title: 'Chat closed',
                  subtitle: 'Your conversation has ended.',
                  time: '2d',
                  messageDetails: MessageDetails(
                    name: 'Support Team',
                    email: 'support@afyabee.com',
                    phone: '+254 700 000 000',
                    message:
                        'Thank you for using our service. Your conversation has been closed. Feel free to reach out if you need further assistance.',
                  ),
                ),
              ],
            ),
            NotificationList(
              type: NotificationType.review,
              items: [
                NotificationItem(
                  title: 'Review request',
                  subtitle: 'Rate your last visit.',
                  time: '10m',
                  rating: 4.5,
                  reviewDetails: ReviewDetails(
                    overallRating: 4.5,
                    serviceQualityRating: 4.8,
                    facilitiesEquipmentRating: 4.2,
                    professionalCompetenceRating: 4.7,
                    impactOutcomeRating: 4.3,
                    communicationRating: 4.6,
                    submittedBy: "Erick Sanga",
                    review:
                        'Excellent service overall. The doctor was very professional and took time to explain everything. The facilities were clean and modern. Would definitely recommend!',
                  ),
                ),
                NotificationItem(
                  title: 'Thanks for your review',
                  subtitle: 'Your feedback helps improve care.',
                  time: '6h',
                  rating: 5,
                  reviewDetails: ReviewDetails(
                    overallRating: 5.0,
                    serviceQualityRating: 5.0,
                    facilitiesEquipmentRating: 5.0,
                    professionalCompetenceRating: 5.0,
                    impactOutcomeRating: 5.0,
                    communicationRating: 5.0,
                    submittedBy: "Jane Doe",
                    review:
                        'Outstanding experience! The staff was incredibly helpful, the doctor was knowledgeable and caring. Everything from booking to follow-up was seamless.',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
