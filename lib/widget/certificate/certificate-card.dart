import 'package:bst_staff_mobile/domain/model/certificate.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:bst_staff_mobile/widget/certificate/certificate.dart';
import 'package:flutter/material.dart';

class CertificateCard extends StatelessWidget {
  final Certificate certificate;
  final Function(int latestRoundId) onclickCertificate;

  const CertificateCard({
    super.key,
    required this.certificate,
    required this.onclickCertificate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onclickCertificate(certificate.id);
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            certificate.fullName,
                            style: const TextStyle(
                              fontSize: FontSizes.medium,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CertificateStatusType(
                            certificateStatus: certificate.certificateStatus ??
                                CertificateStatus.request,
                          ),
                        ],
                      ),
                      const Divider(
                        color: MainColors.divider,
                        thickness: 0.6,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.credit_card,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                certificate.nationalId,
                                style: const TextStyle(
                                  fontSize: FontSizes.small,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'รอบบำบัด : ${certificate.cycle}',
                        style: const TextStyle(
                          fontSize: FontSizes.small,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'วันที่เริ่มบำบัด : ${certificate.requestedDateText}',
                        style: const TextStyle(
                          fontSize: FontSizes.small,
                        ),
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
