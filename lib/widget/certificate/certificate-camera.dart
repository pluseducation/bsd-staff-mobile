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
    if (!_controller.value.isInitialized) {
      return;
    }
    try {
      final directory = await getApplicationDocumentsDirectory();
      final image = await _controller.takePicture();
      final imagePath =
          '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.';
      await image.saveTo(imagePath);
      setState(() {
        _imagePath = imagePath;
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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade700,
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
            const SizedBox(
              height: 4,
            ),
            const Text(
              'กรุณาวางเอกสารให้ตรงกรอบที่กำหนด',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: FontSizes.medium,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
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
                    CameraPreview(_controller)
                  else
                    const Center(child: CircularProgressIndicator()),
                  Container(
                    width: 300,
                    height: 400,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      // ignore: deprecated_member_use
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              color: Colors.black87,
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.camera, color: Colors.white, size: 50),
                  onPressed: _takePicture,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
