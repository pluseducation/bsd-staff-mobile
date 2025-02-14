import 'package:bst_staff_mobile/domain/model/refer.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/patient/patient-status.dart';
import 'package:bst_staff_mobile/widget/refer/refer-status.dart';
import 'package:flutter/material.dart';

class SenderCard extends StatelessWidget {
  final Sender sender;
  final Function(int latestRoundId) onclickRefer;

  const SenderCard({
    super.key,
    required this.sender,
    required this.onclickRefer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onclickRefer(sender.referFromId);
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
                            sender.fullName,
                            style: const TextStyle(
                              fontSize: FontSizes.medium,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WorkFlowStatusType(
                            workFlowStatus: sender.workFlowStatus,
                          ),
                        ],
                      ),
                      const Divider(
                        color: MainColors.divider,
                        thickness: 0.6,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.credit_card,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                sender.nationalId,
                                style: const TextStyle(
                                  fontSize: FontSizes.small,
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            spacing: 8,
                            runSpacing: 4,
                            children: [
                              SenderStatusType(
                                referStatus: sender.referStatus,
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'รอบบำบัด : ${sender.cycle}',
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

class ReceiverCard extends StatelessWidget {
  final Receiver receiver;
  final Function(int latestRoundId) onclickRefer;

  const ReceiverCard({
    super.key,
    required this.receiver,
    required this.onclickRefer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onclickRefer(receiver.referFromId);
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
                            receiver.fullName,
                            style: const TextStyle(
                              fontSize: FontSizes.medium,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WorkFlowStatusType(
                            workFlowStatus: receiver.workFlowStatus,
                          ),
                        ],
                      ),
                      const Divider(
                        color: MainColors.divider,
                        thickness: 0.6,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.credit_card,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                receiver.nationalId,
                                style: const TextStyle(
                                  fontSize: FontSizes.small,
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            spacing: 8,
                            runSpacing: 4,
                            children: [
                              ReceiverStatusType(
                                referStatus: receiver.referStatus,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'รอบบำบัด : ${receiver.cycle}',
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
