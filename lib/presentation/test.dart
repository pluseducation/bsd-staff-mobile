import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/appointment/appointment-status.dart';
import 'package:bst_staff_mobile/widget/certificate/certificate-card.dart';
import 'package:bst_staff_mobile/widget/certificate/certificate-detail-card.dart';
import 'package:bst_staff_mobile/widget/patient/patient-card.dart';
import 'package:bst_staff_mobile/widget/patient/patient.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Test AppointmentStatus',
          style: TextStyle(color: MainColors.white),
        ),
        backgroundColor: MainColors.primary500,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              MyWidgets(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyWidgets extends StatefulWidget {
  const MyWidgets({super.key});

  @override
  State<MyWidgets> createState() => _MyWidgetsState();
}

class _MyWidgetsState extends State<MyWidgets> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              "Patient - Test",
              style: TextStyle(
                fontSize: FontSizes.large,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Assistance",
                  style: TextStyle(
                    fontSize: FontSizes.medium,
                  ),
                ),
                AppointmentStatus(
                  appointmentType: AppointmentType.assistance,
                  round: 1,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Monitoring",
                  style: TextStyle(
                    fontSize: FontSizes.medium,
                  ),
                ),
                AppointmentStatus(
                  appointmentType: AppointmentType.monitoring,
                  round: 2,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Treatment",
                  style: TextStyle(
                    fontSize: FontSizes.medium,
                  ),
                ),
                AppointmentStatus(
                  appointmentType: AppointmentType.treatment,
                  round: 3,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Reject",
                  style: TextStyle(
                    fontSize: FontSizes.medium,
                  ),
                ),
                AppointmentStatus(
                  appointmentType: AppointmentType.reject,
                  round: 4,
                ),
              ],
            ),
            SizedBox(height: 8),
            WorkFlowStatusType(
              workFlowStatus: WorkFlowStatus.treatment,
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                LevelStatusType(levelType: LevelType.urgency),
                DrugEvalResultStatusType(
                  drugEvalResult: DrugEvalResult.dependence,
                ),
                TreatmentStatusType(
                  treatmentType: TreatmentType.opd,
                ),
              ],
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                TreatmentStatusType(
                  treatmentType: TreatmentType.ipdTreatment,
                ),
                MivStatusType(smivType: SmivType.smiv),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class TestStatusView extends StatelessWidget {
  const TestStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Test Status View",
          style: TextStyle(color: MainColors.white),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // SearchBarWidget(),
              SizedBox(
                height: 16,
              ),
              PatientCard(),
              SizedBox(
                height: 16,
              ),
              CertificateCard(),
              SizedBox(
                height: 16,
              ),
              CertificateDetailCard(),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestPatiaSelectScreen extends StatelessWidget {
  const TestPatiaSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BaseAppBarContent(
        title: "Test Patia Select",
      ),
      // body: Padding(
      //   padding: EdgeInsets.all(8.0),
      //   child: PatientSelectSearch(),
      // ),
    );
  }
}

class CameraTest extends StatefulWidget {
  const CameraTest({super.key});

  @override
  State<CameraTest> createState() => _CameraTestState();
}

class _CameraTestState extends State<CameraTest> {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Column(
        children: [
          _buildUI(),
        ],
      ),
    );
  }

  Widget _buildUI() {
    if (cameraController == null ||
        cameraController?.value.isInitialized == false) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("กล้อง"),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.30,
          width: MediaQuery.sizeOf(context).width * 0.80,
          child: CameraPreview(
            cameraController!,
          ),
        ),
      ],
    );
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      cameraController = CameraController(
        cameras.first,
        ResolutionPreset.high,
      );
      print("11111");
      await cameraController?.initialize().then((_) {
        setState(() {});
      });
      print("22222");
    } else {
      setState(() {
        cameras = [];
      });
    }
  }
}
