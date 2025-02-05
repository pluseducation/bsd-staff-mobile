import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:flutter/material.dart';

class PatiaStatusSelectl extends StatefulWidget {
  final Function(WorkFlowStatus) onSelected;

  const PatiaStatusSelectl({
    super.key,
    required this.onSelected,
  });

  @override
  State<PatiaStatusSelectl> createState() => _PatiaStatusSelectlState();
}

class _PatiaStatusSelectlState extends State<PatiaStatusSelectl> {
  WorkFlowStatus? _selectedStatus;

  final Map<WorkFlowStatus, String> statusLabels = {
    WorkFlowStatus.registering: "ลงทะเบียน",
    WorkFlowStatus.screening: "คัดกรอง",
    WorkFlowStatus.treatment: "บำบัด",
    WorkFlowStatus.monitoring: "ติดตาม",
    WorkFlowStatus.assistance: "จำหน่าย",
  };

  final Map<WorkFlowStatus, Color> statusColors = {
    WorkFlowStatus.registering: PatientMainTextColors.registering,
    WorkFlowStatus.screening: PatientMainTextColors.screening,
    WorkFlowStatus.treatment: PatientMainTextColors.treatment,
    WorkFlowStatus.monitoring: PatientMainTextColors.monitoring,
    WorkFlowStatus.assistance: PatientMainTextColors.assistance,
  };

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: statusLabels.keys.map((status) {
        final bool isSelected = _selectedStatus == status;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedStatus = status;
            });
            widget.onSelected(status);
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.transparent : Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: isSelected
                    ? (statusColors[status] ?? Colors.blue)
                    : Colors.grey.shade300,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Text(
              statusLabels[status]!,
              style: TextStyle(
                fontSize: 12,
                color: isSelected
                    ? (statusColors[status] ?? Colors.white)
                    : Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class PatiaOASSelectl extends StatefulWidget {
  final Function(LevelType) onSelected;

  const PatiaOASSelectl({
    super.key,
    required this.onSelected,
  });

  @override
  State<PatiaOASSelectl> createState() => _PatiaOASSelectlState();
}

class _PatiaOASSelectlState extends State<PatiaOASSelectl> {
  LevelType? _selectedOASStatus;

  final Map<LevelType, String> statusLabels = {
    LevelType.normal: "สีเขียว",
    LevelType.semiUrgency: "สีเหลือง",
    LevelType.urgency: "สีส้ม",
    LevelType.emergency: "สีแดง",
  };

  final Map<LevelType, Color> statusColors = {
    LevelType.normal: PatientMainTextColors.normal,
    LevelType.semiUrgency: PatientMainTextColors.semiUrgency,
    LevelType.urgency: PatientMainTextColors.urgency,
    LevelType.emergency: PatientMainTextColors.emergency,
  };

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: statusLabels.keys.map((status) {
        final bool isSelected = _selectedOASStatus == status;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedOASStatus = status;
            });
            widget.onSelected(status);
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.transparent : Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: isSelected
                    ? (statusColors[status] ?? Colors.blue)
                    : Colors.grey.shade300,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/icon_tag.png',
                  width: 12,
                  height: 12,
                  color: isSelected
                      ? (statusColors[status] ?? Colors.white)
                      : Colors.black,
                ),
                const SizedBox(width: 4),
                Text(
                  statusLabels[status]!,
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected
                        ? (statusColors[status] ?? Colors.white)
                        : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class DrugEvalResultSelectl extends StatefulWidget {
  final Function(DrugEvalResult) onSelected;

  const DrugEvalResultSelectl({
    super.key,
    required this.onSelected,
  });

  @override
  State<DrugEvalResultSelectl> createState() => _DrugEvalResultSelectlState();
}

class _DrugEvalResultSelectlState extends State<DrugEvalResultSelectl> {
  DrugEvalResult? _selectedDrugStatus;

  final Map<DrugEvalResult, String> statusLabels = {
    DrugEvalResult.user: "ผู้ใช้",
    DrugEvalResult.abuse: "ผู้เสพ",
    DrugEvalResult.dependence: "ผู้ติด",
  };

  final Map<DrugEvalResult, Color> statusColors = {
    DrugEvalResult.user: PatientMainTextColors.drugUser,
    DrugEvalResult.abuse: PatientMainTextColors.drugAbuse,
    DrugEvalResult.dependence: PatientMainTextColors.drugDependence,
  };

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: statusLabels.keys.map((status) {
        final bool isSelected = _selectedDrugStatus == status;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedDrugStatus = status;
            });
            widget.onSelected(status);
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.transparent : Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: isSelected
                    ? (statusColors[status] ?? Colors.blue)
                    : Colors.grey.shade300,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/icon_tag.png',
                  width: 12,
                  height: 12,
                  color: isSelected
                      ? (statusColors[status] ?? Colors.white)
                      : Colors.black,
                ),
                const SizedBox(width: 4),
                Text(
                  statusLabels[status]!,
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected
                        ? (statusColors[status] ?? Colors.white)
                        : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class TreatmentTypeSelectl extends StatefulWidget {
  final Function(TreatmentType) onSelected;

  const TreatmentTypeSelectl({
    super.key,
    required this.onSelected,
  });

  @override
  State<TreatmentTypeSelectl> createState() => _TreatmentTypeSelectlState();
}

class _TreatmentTypeSelectlState extends State<TreatmentTypeSelectl> {
  TreatmentType? _selectedTreatmentStatus;

  final Map<TreatmentType, String> statusLabels = {
    TreatmentType.opd: "ผู้ป่วยนอก",
    TreatmentType.ipdTreatment: "ผู้ป่วยใน (ระยะบำบัด)",
    TreatmentType.ipdRecover: "ผู้ป่วยใน (ระยะฟื้นฟู)",
    TreatmentType.ipdMini: "มินิธีญฯ",
    TreatmentType.cbtx: "CBTx",
    TreatmentType.network: "ภาคีเครือข่าย",
    TreatmentType.religious: "ศาสนสถาน",
    // TreatmentType.rehabilitationTherapyTrainingCenter: "",
    // TreatmentType.wiwatSchoolProject: "",
    // TreatmentType.programInPrisons: "",
    // TreatmentType.behaviorCamp: "",
    // TreatmentType.other: "",
  };

  final Map<TreatmentType, Color> statusColors = {
    TreatmentType.opd: PatientMainTextColors.opd,
    TreatmentType.ipdTreatment: PatientMainTextColors.ipdTreatment,
    TreatmentType.ipdRecover: PatientMainTextColors.ipdRecover,
    TreatmentType.ipdMini: PatientMainTextColors.ipdMini,
    TreatmentType.cbtx: PatientMainTextColors.cbtx,
    TreatmentType.network: PatientMainTextColors.network,
    TreatmentType.religious: PatientMainTextColors.religious,
  };

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: statusLabels.keys.map((status) {
        final bool isSelected = _selectedTreatmentStatus == status;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedTreatmentStatus = status;
            });
            widget.onSelected(status);
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.transparent : Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: isSelected
                    ? (statusColors[status] ?? Colors.blue)
                    : Colors.grey.shade300,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/icon_tag.png',
                  width: 12,
                  height: 12,
                  color: isSelected
                      ? (statusColors[status] ?? Colors.white)
                      : Colors.black,
                ),
                const SizedBox(width: 4),
                Text(
                  statusLabels[status]!,
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected
                        ? (statusColors[status] ?? Colors.white)
                        : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
// SmivTypeSelectl

class SmivTypeSelectl extends StatefulWidget {
  final Function(SmivType) onSelected;

  const SmivTypeSelectl({
    super.key,
    required this.onSelected,
  });

  @override
  State<SmivTypeSelectl> createState() => _SmivTypeSelectlState();
}

class _SmivTypeSelectlState extends State<SmivTypeSelectl> {
  SmivType? _selectedSmiStatus;

  final Map<SmivType, String> statusLabels = {
    SmivType.smiv: "SMI-V",
  };

  final Map<SmivType, Color> statusColors = {
    SmivType.smiv: PatientMainTextColors.smiv,
  };

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: statusLabels.keys.map((status) {
        final bool isSelected = _selectedSmiStatus == status;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedSmiStatus = status;
            });
            widget.onSelected(status);
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.transparent : Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: isSelected
                    ? (statusColors[status] ?? Colors.blue)
                    : Colors.grey.shade300,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/icon_tag.png',
                  width: 12,
                  height: 12,
                  color: isSelected
                      ? (statusColors[status] ?? Colors.white)
                      : Colors.black,
                ),
                const SizedBox(width: 4),
                Text(
                  statusLabels[status]!,
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected
                        ? (statusColors[status] ?? Colors.white)
                        : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
