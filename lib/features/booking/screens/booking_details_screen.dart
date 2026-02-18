import 'package:afya_bee/core/extensions/build_context_extension.dart';
import 'package:afya_bee/features/booking/widgets/booking_information.dart';
import 'package:afya_bee/features/booking/widgets/patient_info.dart';
import 'package:afya_bee/shared/components/app_button.dart';
import 'package:flutter/material.dart';

class BookingDetailScreen extends StatelessWidget {
  const BookingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new)),
        title: Text("Booking Detail", style: context.titleLarge),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 20),
              PatientInfo(),
              const SizedBox(height: 12),
              BookingInformation(),
              const SizedBox(height: 20),
              Container(
                height: 100,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
                alignment: Alignment.topLeft,
                child: const Text("Add note details...", style: TextStyle(color: Colors.grey)),
              ),
              const SizedBox(height: 20),

              TextButton(
                onPressed: () {},
                child: Text(
                  "Update",
                  style: context.bodyMedium.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w600),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: AppButton.destructive(onPressed: () {}, text: "Reject"),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AppButton(onPressed: () {}, text: "Accept"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tab(String text, bool active) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(color: active ? Colors.white : Colors.transparent, borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w600, color: active ? Colors.black : Colors.grey),
        ),
      ),
    );
  }
}
