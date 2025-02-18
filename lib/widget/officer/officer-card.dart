import 'package:bst_staff_mobile/domain/model/officer.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:flutter/material.dart';

class OfficerCard extends StatelessWidget {
  final Officer officer;
  final Function(int latestRoundId) onclickOfficer;
  final Function(int officerId, bool active) onUpdateOfficer;

  const OfficerCard({
    super.key,
    required this.officer,
    required this.onclickOfficer,
    required this.onUpdateOfficer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onclickOfficer(officer.id);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: MainColors.primary500, width: 0.6),
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // แถวบนมีชื่อ + Switch
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            officer.username,
                            style: const TextStyle(
                              fontSize: FontSizes.medium,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Switch(
                            value: officer.active,
                            onChanged: (bool value) async {
                              await onUpdateOfficer(officer.id, value);
                            },
                            activeColor: Colors.white,
                            activeTrackColor: Colors.green.shade500,
                          ),
                        ],
                      ),
                      const Divider(
                        color: MainColors.divider,
                        thickness: 0.6,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        officer.fullName,
                        style: const TextStyle(
                          fontSize: FontSizes.small,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            officer.roleName,
                            style: const TextStyle(
                              fontSize: FontSizes.small,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
