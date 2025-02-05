import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AppointmentsEvent extends StatelessWidget {
  final List<Map<String, String>> events;
  const AppointmentsEvent({super.key, this.events = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            events.isNotEmpty
                ? events[0]['appointmenDate'] ?? 'ไม่มีนัดหมาย'
                : 'ไม่มีนัดหมาย',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: FontSizes.medium,
            ),
          ),
        ),
        if (events.isNotEmpty)
          CarouselSlider(
            options: CarouselOptions(
              height: 250.0,
              viewportFraction: 0.95,
              aspectRatio: 1.0,
              enableInfiniteScroll: false,
            ),
            items:
                events.map((event) => _AppointmentCard(event: event)).toList(),
          ),
      ],
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  final Map<String, String> event;
  const _AppointmentCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.shade400.withOpacity(0.2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(event['appointmenTime'], event['roundText']),
          const Divider(color: Color(0xFFDEE2E4), thickness: 0.8),
          _buildInfoRow('ผู้ป่วย:', event['fullname'], event['phoneNo']),
          const SizedBox(height: 8),
          _buildInfoRow(
            'ผู้ปกครอง:',
            event['guardianFullname'],
            event['guardianPhoneNo'],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String? time, String? roundText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          time ?? 'ไม่ระบุเวลา',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: FontSizes.medium,
          ),
        ),
        if (roundText != null && roundText.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFECFDF3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              roundText,
              style: const TextStyle(
                fontSize: FontSizes.small,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String? name, String? phone) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: FontSizes.medium,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name ?? 'ไม่ระบุ',
                style: const TextStyle(fontSize: FontSizes.medium),
              ),
              if (phone != null && phone.isNotEmpty)
                Text(
                  phone,
                  style: const TextStyle(
                    fontSize: FontSizes.medium,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
