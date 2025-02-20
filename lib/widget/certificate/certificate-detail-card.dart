import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:bst_staff_mobile/widget/certificate/certificate.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';

class CertificateDetailCard extends StatefulWidget {
  const CertificateDetailCard({
    super.key,
  });

  @override
  State<CertificateDetailCard> createState() => _CertificateDetailCardState();
}

class _CertificateDetailCardState extends State<CertificateDetailCard> {
  bool isApprovedClicked = true;
  bool isRejectedClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: MainColors.primary500),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "มาลี ใจดี",
                  style: TextStyle(
                    fontSize: FontSizes.medium,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(
                  color: MainColors.divider,
                  thickness: 0.6,
                ),
                const SizedBox(height: 8),
                const Row(
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
                const SizedBox(height: 4),
                const Text(
                  "รอบบำบัด : 653210",
                  style: TextStyle(
                    fontSize: FontSizes.small,
                    color: MainColors.text,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "เบอร์โทรศัพท์ : 0812345678",
                  style: TextStyle(
                    fontSize: FontSizes.small,
                    color: MainColors.text,
                  ),
                ),
                const SizedBox(height: 4),
                const Row(
                  children: [
                    Text(
                      "สถานะ : ",
                      style: TextStyle(
                        fontSize: FontSizes.small,
                        color: MainColors.text,
                      ),
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        CertificateDrugType(
                          drugEvalResult: DrugEvalResult.user,
                        ),
                        CertificateWorkFlowType(
                          workFlowStatus: WorkFlowStatus.treatment,
                        ),
                        CertificateLevelType(
                          levelType: LevelType.urgency,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  "ผู้เซ็นรับรอง",
                  style: TextStyle(
                    fontSize: FontSizes.medium,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "นายทดสอบ โรงพยาบาล",
                  style: TextStyle(
                    fontSize: FontSizes.small,
                    color: Color(0xFF273142),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "นายแพทย์",
                  style: TextStyle(
                    fontSize: FontSizes.small,
                    color: Color(0xFFA3A3A3),
                  ),
                ),
                const SizedBox(height: 16),
                _buildActionButtons(),
                const SizedBox(height: 16),
                const Text(
                  "ถ่ายเอกสารเอกสารใบรับรอง",
                  style: TextStyle(
                    fontSize: FontSizes.medium,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildCameraImage(),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print("ตกลง");
                      },
                      // onPressed: _model.isButtonEnabled ? _onSubmit : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MainColors.primary500,
                        padding: const EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'ยืนยัน',
                        style: TextStyle(
                          fontSize: FontSizes.medium,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: isApprovedClicked
              ? ElevatedButton.icon(
                  onPressed: () {
                    _onApproveClick();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    backgroundColor: const Color(0xFF0EB366),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(
                    Icons.radio_button_checked,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "อนุมัติ",
                    style: TextStyle(
                      fontSize: FontSizes.medium,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              : OutlinedButton.icon(
                  onPressed: () {
                    _onApproveClick();
                    print("อนุมัติ22222");
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    side: const BorderSide(color: Color(0xFF0EB366)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(
                    Icons.radio_button_unchecked,
                    color: Color(0xFF0EB366),
                  ),
                  label: const Text(
                    "อนุมัติ",
                    style: TextStyle(
                      fontSize: FontSizes.medium,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0EB366),
                    ),
                  ),
                ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: isRejectedClicked
              ? ElevatedButton.icon(
                  onPressed: () {
                    _onRejectClick();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    backgroundColor: MainColors.error,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(
                    Icons.radio_button_checked,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "ปฏิเสธ",
                    style: TextStyle(
                      fontSize: FontSizes.medium,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              : OutlinedButton.icon(
                  onPressed: () {
                    _onRejectClick();
                    print("ปฏิเสธ");
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    side: const BorderSide(color: MainColors.error),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(
                    Icons.radio_button_unchecked,
                    color: MainColors.error,
                  ),
                  label: const Text(
                    "ปฏิเสธ",
                    style: TextStyle(
                      fontSize: FontSizes.medium,
                      fontWeight: FontWeight.bold,
                      color: MainColors.error,
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildCameraImage() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            print("ถ่ายรูป");
          },
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(color: MainColors.primary500),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  color: MainColors.primary500,
                  size: 40,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "ถ่ายรูป",
                  style: TextStyle(
                    color: MainColors.primary500,
                    fontSize: FontSizes.medium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _onApproveClick() async {
    try {
      setState(() {
        isApprovedClicked = true;
        isRejectedClicked = false;
      });
    } on Exception catch (e) {
      if (!context.mounted) return;

      await showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }

  Future<void> _onRejectClick() async {
    try {
      setState(() {
        isApprovedClicked = false;
        isRejectedClicked = true;
      });
    } on Exception catch (e) {
      if (!context.mounted) return;

      await showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }
}
