import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:bst_staff_mobile/widget/certificate/certificate.dart';
import 'package:flutter/material.dart';

class CertificateCard extends StatelessWidget {
  const CertificateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: MainColors.primary500),
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "มาลี ใจดี",
                          style: TextStyle(
                            fontSize: FontSizes.medium,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CertificateStatusType(
                          certificateStatus: CertificateStatus.request,
                        ),
                      ],
                    ),
                    Divider(
                      color: MainColors.divider,
                      thickness: 0.6,
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.credit_card, size: 18, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          "1579900499231",
                          style: TextStyle(
                            color: MainColors.text,
                            fontSize: FontSizes.small,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "รอบบำบัด : 653210",
                          style: TextStyle(
                            fontSize: FontSizes.small,
                            color: MainColors.text,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "รอบบำบัด :",
                          style: TextStyle(
                            fontSize: FontSizes.small,
                            color: MainColors.text,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "20/03/2567 (2 วันที่แล้ว)",
                          style: TextStyle(
                            fontSize: FontSizes.small,
                            color: MainColors.text,
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
      ],
    );
  }
}
