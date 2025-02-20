import 'dart:io';

import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class CertificateCamera extends StatefulWidget {
  const CertificateCamera({
    super.key,
  });

  @override
  State<CertificateCamera> createState() => _CertificateCameraState();
}

class _CertificateCameraState extends State<CertificateCamera> {
  late CameraDescription camera;
  late List<CameraDescription> cameras;
  late CameraController _controller;
  bool _isCameraInitialized = false;
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    camera = cameras
        .firstWhere((cam) => cam.lensDirection == CameraLensDirection.back);
    _controller = CameraController(camera, ResolutionPreset.medium);
    await _controller.initialize();
    _controller.lockCaptureOrientation(DeviceOrientation.landscapeRight);

    if (!mounted) return;
    setState(() {
      _isCameraInitialized = true;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCameraInitialized) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF211E1E),
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            'ถ่ายรูปเอกสาร',
            style: TextStyle(
              fontSize: FontSizes.large,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'กรุณาวางเอกสารให้ตรงกรอบที่กำหนด',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: FontSizes.medium,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'เห็นตัวอักษรและข้อมูลให้ชัดเจน',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: FontSizes.medium,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _imagePath == null
                ? Padding(
                    padding: const EdgeInsets.only(right: 34, left: 34),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      child: CameraPreview(
                        _controller,
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    child: Image.file(
                      File(_imagePath!),
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          Container(
            height: 200,
            color: const Color(0xFF211E1E),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_imagePath == null)
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.camera,
                            color: Colors.white,
                            size: 50,
                          ),
                          onPressed: _takePicture,
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        const Text(
                          "ยืนยันข้อมูล",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: FontSizes.medium,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "กรุณาตรวจสอบความชัดเจนของภาพเอกสาร",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: FontSizes.small,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.replay,
                                    color: Colors.red,
                                    size: 48,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _imagePath = null;
                                    });
                                  },
                                ),
                                const Text(
                                  "ถ่ายใหม่",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: FontSizes.small,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                    size: 48,
                                  ),
                                  onPressed: () {
                                    _confirmTakePicture(File(_imagePath!));
                                  },
                                ),
                                const Text(
                                  "ยืนยัน",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: FontSizes.small,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _takePicture() async {
    if (!_controller.value.isInitialized) return;
    try {
      final XFile imageFile = await _controller.takePicture();
      final List<int> imageBytes = await File(imageFile.path).readAsBytes();
      final img.Image? image = img.decodeImage(Uint8List.fromList(imageBytes));
      if (image == null) {
        print("Error decoding image.");
        return;
      }

      final img.Image rotatedImage = img.copyRotate(image, angle: 270);

      final directory = await getApplicationDocumentsDirectory();
      final rotatedImagePath =
          '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.png';

      File(rotatedImagePath).writeAsBytesSync(img.encodeJpg(rotatedImage));

      setState(() {
        _imagePath = rotatedImagePath;
        print("Rotated Image Path:=====>>>>> $_imagePath");
      });

      await File(imageFile.path).delete();
    } catch (e) {
      print("Error taking picture: $e");
    }
  }

  Future<void> _confirmTakePicture(File imageFile) async {
    try {
      Navigator.pop(context, imageFile);
    } catch (e) {
      if (!context.mounted) return;
      await showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }
}
