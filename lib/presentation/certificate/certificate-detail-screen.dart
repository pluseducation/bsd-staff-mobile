import 'dart:io';

import 'package:bst_staff_mobile/data/repository/certificate-repository.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/certificate/certificate-detail-model.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:bst_staff_mobile/widget/certificate/certificate-camera.dart';
import 'package:bst_staff_mobile/widget/certificate/certificate.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class CertificateDetailScreen extends StatelessWidget {
  final int certificateById;
  const CertificateDetailScreen({
    super.key,
    required this.certificateById,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.background,
      appBar: AppBar(
        backgroundColor: MainColors.background,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'รายการใบรับรอง',
            style: TextStyle(
              fontSize: FontSizes.medium,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CertificateDetailContent(certificateById: certificateById),
            ),
          ),
        ),
      ),
    );
  }
}

class CertificateDetailContent extends StatefulWidget {
  final int certificateById;

  const CertificateDetailContent({
    super.key,
    required this.certificateById,
  });

  @override
  State<CertificateDetailContent> createState() =>
      _CertificateDetailCardState();
}

class _CertificateDetailCardState extends State<CertificateDetailContent> {
  late CertificateDetailModel _model;
  String? _imagePath;
  CertificateStatus? _selectedStatus;

  @override
  void initState() {
    super.initState();

    _model = CertificateDetailModel(
      log: Provider.of<Logger>(context, listen: false),
      certificateRepository:
          Provider.of<CertificateRepository>(context, listen: false),
      appService: Provider.of<AppService>(context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CertificateDetailModel>.value(
      value: _model,
      child: FutureBuilder<bool>(
        future: _model.initData(widget.certificateById),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('ไม่พบข้อมูล'));
          } else {
            return Consumer<CertificateDetailModel>(
              builder: (context, model, child) {
                final certificateDetail = model.certificateDetail;

                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: MainColors.primary500),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
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
                            Row(
                              children: [
                                const Icon(
                                  Icons.credit_card,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  certificateDetail.nationalId,
                                  style: const TextStyle(
                                    fontSize: FontSizes.small,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "รอบบำบัด : ${certificateDetail.cycle}",
                              style: const TextStyle(
                                fontSize: FontSizes.small,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "เบอร์โทรศัพท์ : ${certificateDetail.phoneNo}",
                              style: const TextStyle(
                                fontSize: FontSizes.small,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Text(
                                  "สถานะ : ",
                                  style: TextStyle(
                                    fontSize: FontSizes.small,
                                  ),
                                ),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 4,
                                  children: [
                                    CertificateDrugType(
                                      drugEvalResult:
                                          certificateDetail.drugEvalResult,
                                    ),
                                    CertificateWorkFlowType(
                                      workFlowStatus:
                                          certificateDetail.workFlowStatus,
                                    ),
                                    CertificateLevelType(
                                      levelType: certificateDetail.levelType,
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
                            Text(
                              certificateDetail.fullNameApproved,
                              style: const TextStyle(
                                fontSize: FontSizes.small,
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
                            // if (_model.certificateDetail.fileName.isNotEmpty)
                            //   _buildShowImage()
                            // else
                            _buildCameraImage(),
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _confirm();
                                  },
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
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildActionButtons() {
    return Consumer<CertificateDetailModel>(
      builder: (context, model, child) {
        return Row(
          children: [
            Expanded(
              child: model.isApprovedClicked
                  ? ElevatedButton.icon(
                      onPressed: () {
                        _selectedStatus = CertificateStatus.completed;
                        model.approve();
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
                        _selectedStatus = CertificateStatus.completed;
                        model.approve();
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
              child: model.isRejectedClicked
                  ? ElevatedButton.icon(
                      onPressed: () {
                        _selectedStatus = CertificateStatus.denied;
                        model.reject();
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
                        _selectedStatus = CertificateStatus.denied;
                        model.reject();
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
      },
    );
  }

  Widget _buildCameraImage() {
    return Column(
      children: [
        GestureDetector(
          onTap: _openCamera,
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

  Widget _buildShowImage() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              _model.certificateDetail.fileName,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              onPressed: () {
                print("แก้ไข้เอกสาร");
              },
              icon: const Icon(Icons.camera_alt, size: 18, color: Colors.blue),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _openCamera() async {
    final File? imageFile = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CertificateCamera(),
      ),
    );

    if (imageFile != null) {
      setState(() {
        _imagePath = imageFile.path;
      });
      return;
    }
  }

  Future<void> _confirm() async {
    try {
      if (_selectedStatus == null) {
        await showInfoDialog(
          context: context,
          message: 'กรุณาเลือกสถานะก่อนยืนยัน',
        );
        return;
      }

      if (_selectedStatus != null) {
        File? imageFile;
        if (_imagePath != null) {
          imageFile = File(_imagePath!);
        }
        await _model.updateCertificateStatus(
          id: _model.certificateDetail.id,
          status: _selectedStatus!,
          imageFile: imageFile!,
        );
      }
      Navigator.pop(context);
    } catch (e) {
      if (!context.mounted) return;
      await showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }
}
