import 'dart:io';

import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CertificateCamera extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CertificateCamera({super.key, required this.cameras});

  @override
  State<CertificateCamera> createState() => _CertificateCameraState();
}

class _CertificateCameraState extends State<CertificateCamera> {
  late CameraController _controller;
  bool _isCameraInitialized = false;
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    if (widget.cameras.isNotEmpty) {
      _initializeCamera();
    } else {
      setState(() {
        _isCameraInitialized = false;
      });
    }
  }

  Future<void> _initializeCamera() async {
    _controller = CameraController(widget.cameras[0], ResolutionPreset.medium);
    await _controller.initialize();
    if (!mounted) return;
    setState(() {
      _isCameraInitialized = true;
    });
  }

  Future<void> _takePicture() async {
    if (!_controller.value.isInitialized) return;
    try {
      final directory = await getApplicationDocumentsDirectory();
      final image = await _controller.takePicture();

      final imagePath =
          '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.png';
      await image.saveTo(imagePath);

      setState(() {
        _imagePath = imagePath;
        print("Image Path:=====>>>>> $_imagePath");
      });
    } catch (e) {
      print("Error taking picture: $e");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (_isCameraInitialized)
                  Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    child: CameraPreview(_controller),
                  ),
                if (_imagePath != null)
                  Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    child: Image.file(
                      File(_imagePath!),
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
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
                                  onPressed: () async {
                                    Navigator.pop(context, _imagePath);
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
}
