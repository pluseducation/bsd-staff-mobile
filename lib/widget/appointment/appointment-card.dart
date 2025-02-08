import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AppointmentsCard extends StatelessWidget {
  final List<Map<String, String>> events;
  const AppointmentsCard({super.key, this.events = const []});

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
            items: events.map((event) => _buildCard(event)).toList(),
          ),
      ],
    );
  }

  Widget _buildCard(Map<String, String> event) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                event["appointmenTime"] ?? 'ไม่ระบุเวลา',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: FontSizes.medium,
                ),
              ),
              if (event["roundText"] != null)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFECFDF3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    event["roundText"].toString(),
                    style: const TextStyle(
                      fontSize: FontSizes.small,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          const Divider(color: Color(0xFFDEE2E4), thickness: 0.8),
          Row(
            children: [
              const SizedBox(
                width: 100,
                child: Text(
                  "ผู้ป่วย:",
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
                      event['fullname'] ?? 'ไม่ระบุ',
                      style: const TextStyle(fontSize: FontSizes.medium),
                    ),
                    if (event['phoneNo'] != null)
                      Text(
                        event['phoneNo'].toString(),
                        style: const TextStyle(
                          fontSize: FontSizes.medium,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(
                width: 100,
                child: Text(
                  "ผู้ปกครอง:",
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
                      event['guardianFullname'] ?? 'ไม่ระบุ',
                      style: const TextStyle(fontSize: FontSizes.medium),
                    ),
                    if (event['guardianPhoneNo'] != null)
                      Text(
                        event['guardianPhoneNo'].toString(),
                        style: const TextStyle(
                          fontSize: FontSizes.medium,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
