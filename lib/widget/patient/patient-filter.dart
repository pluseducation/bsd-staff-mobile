import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:bst_staff_mobile/widget/patient/patient-status.dart';
import 'package:flutter/material.dart';

class PatientFilter extends StatefulWidget {
  final Function(
    String,
    List<WorkFlowStatus>,
    List<LevelType>,
    List<DrugEvalResult>,
    List<TreatmentType>,
    List<SmivType>,
  ) onSearch;
  final String value;
  final List<WorkFlowStatus> workFlowStatus;
  final List<LevelType> levelTypes;
  final List<DrugEvalResult> drugEvalResults;
  final List<TreatmentType> treatmentTypes;
  final List<SmivType> smivTypes;

  const PatientFilter({
    super.key,
    required this.value,
    required this.onSearch,
    required this.workFlowStatus,
    required this.levelTypes,
    required this.drugEvalResults,
    required this.treatmentTypes,
    required this.smivTypes,
  });

  @override
  State<PatientFilter> createState() => _PatientFilterState();
}

class _PatientFilterState extends State<PatientFilter> {
  final TextEditingController _controller = TextEditingController();
  final List<WorkFlowStatus> _selecteWorkFlowStatus = [];
  final List<LevelType> _selecteLevelType = [];
  final List<DrugEvalResult> _selecteDrugEvalResult = [];
  final List<TreatmentType> _selecteTreatmentType = [];
  final List<SmivType> _selecteSmivType = [];

  @override
  void initState() {
    // TODO: implement initState
    initData();
    super.initState();
  }

  void initData() {
    _controller.text = widget.value;
    _selecteWorkFlowStatus.addAll(widget.workFlowStatus);
    _selecteLevelType.addAll(widget.levelTypes);
    _selecteDrugEvalResult.addAll(widget.drugEvalResults);
    _selecteTreatmentType.addAll(widget.treatmentTypes);
    _selecteSmivType.addAll(widget.smivTypes);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText:
                          'ค้นหาจากชื่อ-นามสกุล, เลขบัตร/เลขแทน, เลขรอบบำบัด',
                      hintStyle: const TextStyle(
                        fontSize: FontSizes.small,
                        color: MainColors.text,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                      ),
                      filled: true,
                    ),
                    style: const TextStyle(
                      fontSize: FontSizes.small,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "สถานะ",
              style: TextStyle(
                fontSize: FontSizes.medium,
              ),
            ),

            const SizedBox(height: 8),
            // flex wrap row
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _buildWorkFlowStatusType(),
            ),
            const SizedBox(height: 16),
            const Text(
              "OAS",
              style: TextStyle(
                fontSize: FontSizes.medium,
              ),
            ),
            const SizedBox(height: 8),
            // flex wrap row
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _buildLevelType(),
            ),
            const SizedBox(height: 16),
            const Text(
              "V2",
              style: TextStyle(
                fontSize: FontSizes.medium,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _buildDrugEvalResult(),
            ),
            const SizedBox(height: 16),
            const Text(
              "ประเภท การบำบัดรักษาล่าสุด",
              style: TextStyle(
                fontSize: FontSizes.medium,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _buildTreatmentType(),
            ),
            const SizedBox(height: 16),
            const Text(
              "สถานะเพิ่มเติม",
              style: TextStyle(
                fontSize: FontSizes.medium,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _buildSmivType(),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  side: const BorderSide(
                    color: Color(0xFFDFE1E6),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  "ยกเลิก",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: FontSizes.medium,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  widget.onSearch(
                    _controller.text,
                    _selecteWorkFlowStatus,
                    _selecteLevelType,
                    _selecteDrugEvalResult,
                    _selecteTreatmentType,
                    _selecteSmivType,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MainColors.primary500,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  "ตกลง",
                  style: TextStyle(
                    fontSize: FontSizes.medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildWorkFlowStatusType() {
    return workFlowStatus.map((item) {
      if (_selecteWorkFlowStatus.contains(item)) {
        return IntrinsicWidth(
          child: GestureDetector(
            onTap: () {
              _onTabWorkFlowStatusItem(item);
            },
            child: WorkFlowStatusTypeSelect(
              workFlowStatus: item,
            ),
          ),
        );
      } else {
        return IntrinsicWidth(
          child: GestureDetector(
            onTap: () {
              _onTabWorkFlowStatusItem(item);
            },
            child: WorkFlowStatusTypeEmpty(
              workFlowStatus: item,
            ),
          ),
        );
      }
    }).toList();
  }

  List<Widget> _buildLevelType() {
    return levelTypes.map((item) {
      if (_selecteLevelType.contains(item)) {
        return IntrinsicWidth(
          child: GestureDetector(
            onTap: () {
              _onTabLevelTypeItem(item);
            },
            child: LevelStatusTypeSelect(
              levelType: item,
            ),
          ),
        );
      } else {
        return IntrinsicWidth(
          child: GestureDetector(
            onTap: () {
              _onTabLevelTypeItem(item);
            },
            child: LevelStatusTypeEmpty(
              levelType: item,
            ),
          ),
        );
      }
    }).toList();
  }

  List<Widget> _buildDrugEvalResult() {
    return drugEvalResults.map((item) {
      if (_selecteDrugEvalResult.contains(item)) {
        return IntrinsicWidth(
          child: GestureDetector(
            onTap: () {
              _onTabDrugEvalResultItem(item);
            },
            child: DrugEvalResultStatusTypeSelect(
              drugEvalResult: item,
            ),
          ),
        );
      } else {
        return IntrinsicWidth(
          child: GestureDetector(
            onTap: () {
              _onTabDrugEvalResultItem(item);
            },
            child: DrugEvalResultStatusTypeEmpty(
              drugEvalResult: item,
            ),
          ),
        );
      }
    }).toList();
  }

  List<Widget> _buildTreatmentType() {
    return treatmentTypes.map((item) {
      if (_selecteTreatmentType.contains(item)) {
        return IntrinsicWidth(
          child: GestureDetector(
            onTap: () {
              _onTabTreatmentTypeItem(item);
            },
            child: TreatmentStatusTypeSelect(
              treatmentType: item,
            ),
          ),
        );
      } else {
        return IntrinsicWidth(
          child: GestureDetector(
            onTap: () {
              _onTabTreatmentTypeItem(item);
            },
            child: TreatmentStatusTypeEmpty(
              treatmentType: item,
            ),
          ),
        );
      }
    }).toList();
  }

  List<Widget> _buildSmivType() {
    return smivTypes.map((item) {
      if (_selecteSmivType.contains(item)) {
        return IntrinsicWidth(
          child: GestureDetector(
            onTap: () {
              _onTabSmivTypeItem(item);
            },
            child: SmivStatusTypeSelect(
              smivType: item,
            ),
          ),
        );
      } else {
        return IntrinsicWidth(
          child: GestureDetector(
            onTap: () {
              _onTabSmivTypeItem(item);
            },
            child: SmivStatusTypeEmpty(
              smivType: item,
            ),
          ),
        );
      }
    }).toList();
  }

  void _onTabWorkFlowStatusItem(WorkFlowStatus workFlowStatus) {
    if (_selecteWorkFlowStatus.contains(workFlowStatus)) {
      setState(() {
        _selecteWorkFlowStatus.remove(workFlowStatus);
      });
    } else {
      setState(() {
        _selecteWorkFlowStatus.add(workFlowStatus);
      });
    }
  }

  void _onTabLevelTypeItem(LevelType levelType) {
    if (_selecteLevelType.contains(levelType)) {
      setState(() {
        _selecteLevelType.remove(levelType);
      });
    } else {
      setState(() {
        _selecteLevelType.add(levelType);
      });
    }
  }

  void _onTabDrugEvalResultItem(DrugEvalResult drugEvalResult) {
    if (_selecteDrugEvalResult.contains(drugEvalResult)) {
      setState(() {
        _selecteDrugEvalResult.remove(drugEvalResult);
      });
    } else {
      setState(() {
        _selecteDrugEvalResult.add(drugEvalResult);
      });
    }
  }

  void _onTabTreatmentTypeItem(TreatmentType treatmentType) {
    if (_selecteTreatmentType.contains(treatmentType)) {
      setState(() {
        _selecteTreatmentType.remove(treatmentType);
      });
    } else {
      setState(() {
        _selecteTreatmentType.add(treatmentType);
      });
    }
  }

  void _onTabSmivTypeItem(SmivType smivType) {
    if (_selecteSmivType.contains(smivType)) {
      setState(() {
        _selecteSmivType.remove(smivType);
      });
    } else {
      setState(() {
        _selecteSmivType.add(smivType);
      });
    }
  }
}

final List<WorkFlowStatus> workFlowStatus = [
  WorkFlowStatus.registering,
  WorkFlowStatus.screening,
  WorkFlowStatus.treatment,
  WorkFlowStatus.monitoring,
  WorkFlowStatus.discharged,
];

final List<LevelType> levelTypes = [
  LevelType.normal,
  LevelType.semiUrgency,
  LevelType.urgency,
  LevelType.emergency,
];

final List<DrugEvalResult> drugEvalResults = [
  DrugEvalResult.user,
  DrugEvalResult.abuse,
  DrugEvalResult.dependence,
];

final List<TreatmentType> treatmentTypes = [
  TreatmentType.opd,
  TreatmentType.ipdTreatment,
  TreatmentType.ipdRecover,
  TreatmentType.ipdMini,
  TreatmentType.cbtx,
  TreatmentType.network,
  TreatmentType.religious,
  TreatmentType.other,
];

final List<TreatmentType> treatmentDjopTypes = [
  TreatmentType.rehabilitationTherapyJopc,
  TreatmentType.rehabilitationTherapyTrainingCenter,
  TreatmentType.wiwatSchoolProject,
  TreatmentType.programInPrisons,
  TreatmentType.behaviorCamp,
  TreatmentType.other,
];

final List<SmivType> smivTypes = [
  SmivType.smiv,
  SmivType.noSmiv,
];
