import 'package:afya_bee/core/extensions/build_context_extension.dart';
import 'package:afya_bee/features/booking/widgets/booking_information.dart';
import 'package:afya_bee/shared/components/app_button.dart';
import 'package:afya_bee/shared/components/input_fields.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class BookingDetailScreen extends StatelessWidget {
  const BookingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new)),
        title: InkWell(
          onTap: () {
            //..make a phone call
          },
          child: Row(
            spacing: 8,
            children: [
              HugeIcon(icon: HugeIcons.strokeRoundedCall, color: context.colorScheme.primary, size: 18),
              Text("Sarah Jenkins", style: context.bodyLarge.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        surfaceTintColor: context.colorScheme.surface,
        centerTitle: true,
        actions: [],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // const SizedBox(height: 20),
              // const PatientInfo(),
              const SizedBox(height: 12),
              const BookingInformation(),
              const SizedBox(height: 20),
              InputField(
                labelText: "Doctor's Note",
                hintText: "Add any notes or instructions for the doctor regarding this booking.",
                maxLines: 2,
                onChanged: (value) {
                  // Handle doctor's note input change
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Update",
                  style: context.bodyMedium.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 24),
              // Spacer(),
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
