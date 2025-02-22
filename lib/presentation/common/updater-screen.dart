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

  @override
  void initState() {
    super.initState();
    _model = UpdaterModel(
      log: Provider.of<Logger>(super.context, listen: false),
      configRepository:
          Provider.of<ConfigRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UpdaterModel>.value(
      value: _model,
      child: FutureBuilder<bool>(
        future: _model.initData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            );
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data'));
          } else {
            return Consumer<UpdaterModel>(
              builder: (context, model, child) {
                if (model.checkUpdate()) {
                  return Scaffold(
                    body: Center(
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center vertically
                        crossAxisAlignment:
                            CrossAxisAlignment.center, // Center horizontally
                        mainAxisSize: MainAxisSize
                            .min, // Minimize the height of the Column
                        children: [
                          Text(
                            "App Version ปัจจุบันคือ ${model.currentVersion}",
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
                          if (model.updateUrl.isNotEmpty) ...[
                            SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(10),
                                ),
                                onPressed: () {
                                  launchWeb(model.updateUrl);
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
                } else {
                  return widget.child;
                }
              },
            );
          }
        },
      ),
    );
  }
}
