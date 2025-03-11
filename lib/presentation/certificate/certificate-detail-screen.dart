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
  final int certificateId;
  final CertificateStatus? status;
  const CertificateDetailScreen({
    super.key,
    required this.certificateId,
    required this.status,
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
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CertificateDetailContent(
                certificateId: certificateId,
                status: status,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CertificateDetailContent extends StatefulWidget {
  final int certificateId;
  final CertificateStatus? status;

  const CertificateDetailContent({
    super.key,
    required this.certificateId,
    required this.status,
  });

  @override
  State<CertificateDetailContent> createState() =>
      _CertificateDetailCardState();
}

class _CertificateDetailCardState extends State<CertificateDetailContent> {
  late CertificateDetailModel _model;

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
        future: _model.initData(widget.certificateId, widget.status),
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
                            if (model.isRequest == true) ...[
                              _buildActionButtons(),
                            ] else ...[
                              _buildStatus(model.status),
                            ],
                            const SizedBox(height: 16),
                            if (model.isRequest == true) ...[
                              const Text(
                                "ถ่ายเอกสารเอกสารใบรับรอง",
                                style: TextStyle(
                                  fontSize: FontSizes.medium,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              if (model.isShowImage) ...[
                                _buildShowImage(),
                              ] else ...[
                                _buildCameraImage(),
                              ],
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
              child: model.isApproved
                  ? ElevatedButton.icon(
                      onPressed: () {
                        model.approve();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        backgroundColor: MainColors.success,
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
                        model.approve();
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        side: const BorderSide(
                          color: MainColors.success,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: const Icon(
                        Icons.radio_button_unchecked,
                        color: MainColors.success,
                      ),
                      label: const Text(
                        "อนุมัติ",
                        style: TextStyle(
                          fontSize: FontSizes.medium,
                          fontWeight: FontWeight.bold,
                          color: MainColors.success,
                        ),
                      ),
                    ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: model.isRejected
                  ? ElevatedButton.icon(
                      onPressed: () {
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

  Widget _buildStatus(CertificateStatus? status) {
    if (status == CertificateStatus.completed) {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: MainColors.success,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Row(
          children: [
            Icon(
              Icons.radio_button_checked,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              'อนุมัติ',
              style: TextStyle(
                fontSize: FontSizes.medium,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    } else if (status == CertificateStatus.denied) {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: MainColors.error,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Row(
          children: [
            Icon(
              Icons.radio_button_checked,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              'ปฏิเสธ',
              style: TextStyle(
                fontSize: FontSizes.medium,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
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
          width: double.infinity,
          height: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: _model.fileType == "NETWORK"
                ? Image.network(
                    _model.networkPath ?? "",
                    fit: BoxFit.fill,
                  )
                : Image.file(
                    _model.file!,
                    fit: BoxFit.fitHeight,
                  ),
          ),
        ),
        if (_model.isRequest == true) ...[
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
                  _openCamera();
                },
                icon:
                    const Icon(Icons.camera_alt, size: 18, color: Colors.blue),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ),
          ),
        ]
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
      _model.setLocalFile(imageFile);
    }
  }

  Future<void> _confirm() async {
    try {
      if (_model.status == null ||
          _model.file == null ||
          _model.status == CertificateStatus.request) {
        await showInfoDialog(
          context: context,
          message: 'กรุณาเลือกสถานะและไฟล์ก่อนยืนยัน',
        );
        return;
      }
      await _model.updateCertificateStatus();
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
