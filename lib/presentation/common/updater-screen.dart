import 'package:bst_staff_mobile/data/repository/config-repository.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/common/updater-model.dart';
import 'package:bst_staff_mobile/util/launch.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class UpdaterScreen extends StatefulWidget {
  final Widget child;

  const UpdaterScreen({super.key, required this.child});

  @override
  State<UpdaterScreen> createState() => _UpdaterScreenState();
}

class _UpdaterScreenState extends State<UpdaterScreen> {
  late final UpdaterModel _model;
  late bool isChecked = false;

  @override
  void initState() {
    super.initState();
    _model = UpdaterModel(
      log: Provider.of<Logger>(super.context, listen: false),
      configRepository:
          Provider.of<ConfigRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkForUpdate();
    });
  }

  Future<void> _checkForUpdate() async {
    final isUpdate = await _model.initData();
    setState(() {
      isChecked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isChecked) {
      final isUpdate = _model.checkUpdate();
      if (isUpdate) {
        return _buildUpdateScreen();
      } else {
        return widget.child;
      }
    }

    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildUpdateScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          mainAxisSize: MainAxisSize.min, // Minimize the height of the Column
          children: [
            Text(
              "App Version ปัจจุบันคือ ${_model.currentVersion}",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "กรุณาอัพเดทแอพพลิเคชั่นก่อนเข้าใช้งาน",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            if (_model.updateUrl.isNotEmpty) ...[
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                  ),
                  onPressed: () {
                    launchWeb(_model.updateUrl);
                  },
                  child: const Text(
                    'อัพเดท',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
