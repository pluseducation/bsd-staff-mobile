import 'package:flutter/material.dart';

class AppointmentsEvent extends StatefulWidget {
  final List<Map<String, String>> events;
  const AppointmentsEvent({super.key, this.events = const []});

  @override
  _AppointmentsEventState createState() => _AppointmentsEventState();
}

class _AppointmentsEventState extends State<AppointmentsEvent> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0),
          child: Text(
            widget.events.isNotEmpty
                ? widget.events[0]['appointmenDate'] ?? 'ไม่มีนัดหมาย'
                : 'ไม่มีนัดหมาย',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        if (widget.events.isNotEmpty)
          SizedBox(
            height: 240.0,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.events.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0), // Spacing
                  child: _AppointmentCard(event: widget.events[index]),
                );
              },
            ),
          )
      ],
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  final Map<String, String> event;
  const _AppointmentCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(event['appointmenTime'], event['roundText']),
              const Divider(color: Color(0xFFDEE2E4), thickness: 0.8),
              _buildInfoRow('ผู้ป่วย:', event['fullname'], event['phoneNo']),
              const SizedBox(height: 10),
              _buildInfoRow(
                'ผู้ปกครอง:',
                event['guardianFullname'],
                event['guardianPhoneNo'],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String? time, String? roundText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          time ?? 'ไม่ระบุเวลา',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            roundText ?? '',
            style: const TextStyle(
                fontSize: 14, color: Colors.green, fontWeight: FontWeight.bold),
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
          child: Text(label,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name ?? 'ไม่ระบุ', style: const TextStyle(fontSize: 16)),
              Text(phone ?? '',
                  style: const TextStyle(fontSize: 16, color: Colors.blue)),
            ],
          ),
        ),
      ],
    );
  }
}
