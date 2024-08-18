import 'package:bst_staff_mobile/data/repository/workflow-repository.dart';
import 'package:bst_staff_mobile/domain/model/workflow.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/patient/workflow-model.dart';
import 'package:bst_staff_mobile/widget/layout/base-layout.dart';
import 'package:bst_staff_mobile/widget/status-widget.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class RegisteringScreen extends StatefulWidget {
  final int patientId;
  const RegisteringScreen({super.key, required this.patientId});

  @override
  State<RegisteringScreen> createState() => _RegisteringScreenState();
}

class _RegisteringScreenState extends State<RegisteringScreen> {
  late final WorkflowdModel _model;

  @override
  void initState() {
    super.initState();
    _model = WorkflowdModel(
      log: Provider.of<Logger>(super.context, listen: false),
      workflowRepository:
          Provider.of<WorkflowRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Registering>(
      future: _model.findRegistering(widget.patientId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data'));
        } else {
          final data = snapshot.data!;

          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: BaseLayoutPadding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/profile2.png",
                              width: 100,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.fullname,
                                  style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    patientStatusWidget(data.patientStatus),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    mentalEvalLevelWidget(data.level),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: Color(0xFFF1F1F1),
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "ข้อมูลส่วนบุคคล",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Text(
                              "วันเดือนปีเกิด",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF848484),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              data.dateOfBirthText,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "เพศ",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF848484),
                              ),
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            Text(
                              data.gender,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "สัญชาติ",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF848484),
                              ),
                            ),
                            const SizedBox(
                              width: 74,
                            ),
                            Text(
                              data.nationalityText,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "ศาสนา",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF848484),
                              ),
                            ),
                            const SizedBox(
                              width: 82,
                            ),
                            Text(
                              data.religionText,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "ที่อยู่",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "ที่อยู่ตามทะเบียนราษฎร์",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xFF434343)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          data.registereText,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "ที่อยู่ปัจจุบัน",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xFF434343)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          data.currentAddrText,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "ข้อมูลผู้ปกครอง",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        if (data.guardianfullNameText.isNotEmpty &&
                            data.guardianPhoneNo.isNotEmpty)
                          Column(
                            children: [
                              Text(
                                data.guardianfullNameText,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                data.guardianPhoneNo,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          )
                        else
                          const Text(
                            'ไม่พบข้อมูลผู้ปกครอง',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "การเข้าสู่ระบบมาตรการบำบัด",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          data.joinTreatmentByText,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        if (data.joinSentByCourtText.isNotEmpty)
                          Text(
                            data.joinSentByCourtText,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
