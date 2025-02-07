import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:flutter/material.dart';

class PatiaStatusSelect extends StatefulWidget {
  final Function(WorkFlowStatus?) onSelected;
  final WorkFlowStatus? initialSelectedStatus;

  const PatiaStatusSelect({
    super.key,
    required this.onSelected,
    this.initialSelectedStatus,
  });

  @override
  State<PatiaStatusSelect> createState() => _PatiaStatusSelectState();
}

class _PatiaStatusSelectState extends State<PatiaStatusSelect> {
  WorkFlowStatus? _selectedStatus;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.initialSelectedStatus;
  }

  final Map<WorkFlowStatus, String> statusLabels = {
    WorkFlowStatus.registering: "ลงทะเบียน",
    WorkFlowStatus.screening: "คัดกรอง",
    WorkFlowStatus.treatment: "บำบัด",
    WorkFlowStatus.monitoring: "ติดตาม",
    WorkFlowStatus.assistance: "ช่วยเหลือ",
    WorkFlowStatus.discharged: "จำหน่าย",
  };

  final Map<WorkFlowStatus, Color> statusColors = {
    WorkFlowStatus.registering: PatientStatusColors.registering,
    WorkFlowStatus.screening: PatientStatusColors.screening,
    WorkFlowStatus.treatment: PatientStatusColors.treatment,
    WorkFlowStatus.monitoring: PatientStatusColors.monitoring,
    WorkFlowStatus.assistance: PatientStatusColors.assistance,
    WorkFlowStatus.discharged: PatientStatusColors.discharged,
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
              _selectedStatus = isSelected ? null : status;
            });
            widget.onSelected(_selectedStatus);
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

class PatiaOASSelect extends StatefulWidget {
  final Function(LevelType?) onSelected;
  final LevelType? initialSelectedStatus;

  const PatiaOASSelect({
    super.key,
    required this.onSelected,
    this.initialSelectedStatus,
  });

  @override
  State<PatiaOASSelect> createState() => _PatiaOASSelectState();
}

class _PatiaOASSelectState extends State<PatiaOASSelect> {
  LevelType? _selectedOASStatus;

  @override
  void initState() {
    super.initState();
    _selectedOASStatus = widget.initialSelectedStatus;
  }

  final Map<LevelType, String> statusLabels = {
    LevelType.normal: "สีเขียว",
    LevelType.semiUrgency: "สีเหลือง",
    LevelType.urgency: "สีส้ม",
    LevelType.emergency: "สีแดง",
  };

  final Map<LevelType, Color> statusColors = {
    LevelType.normal: PatientLevelTypeColors.normal,
    LevelType.semiUrgency: PatientLevelTypeColors.semiUrgency,
    LevelType.urgency: PatientLevelTypeColors.urgency,
    LevelType.emergency: PatientLevelTypeColors.emergency,
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
              _selectedOASStatus = isSelected ? null : status;
            });
            widget.onSelected(_selectedOASStatus);
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

class DrugEvalResultSelect extends StatefulWidget {
  final Function(DrugEvalResult?) onSelected;
  final DrugEvalResult? initialSelectedStatus;

  const DrugEvalResultSelect({
    super.key,
    required this.onSelected,
    this.initialSelectedStatus,
  });

  @override
  State<DrugEvalResultSelect> createState() => _DrugEvalResultSelectState();
}

class _DrugEvalResultSelectState extends State<DrugEvalResultSelect> {
  DrugEvalResult? _selectedDrugStatus;

  @override
  void initState() {
    super.initState();
    _selectedDrugStatus = widget.initialSelectedStatus;
  }

  final Map<DrugEvalResult, String> statusLabels = {
    DrugEvalResult.user: "ผู้ใช้",
    DrugEvalResult.abuse: "ผู้เสพ",
    DrugEvalResult.dependence: "ผู้ติด",
  };

  final Map<DrugEvalResult, Color> statusColors = {
    DrugEvalResult.user: PatientDrugEvalResultColors.drugUser,
    DrugEvalResult.abuse: PatientDrugEvalResultColors.drugAbuse,
    DrugEvalResult.dependence: PatientDrugEvalResultColors.drugDependence,
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
              _selectedDrugStatus = isSelected ? null : status;
            });
            widget.onSelected(_selectedDrugStatus);
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

class TreatmentTypeSelect extends StatefulWidget {
  final Function(TreatmentType?) onSelected;
  final TreatmentType? initialSelectedStatus;

  const TreatmentTypeSelect({
    super.key,
    required this.onSelected,
    this.initialSelectedStatus,
  });

  @override
  State<TreatmentTypeSelect> createState() => _TreatmentTypeSelectState();
}

class _TreatmentTypeSelectState extends State<TreatmentTypeSelect> {
  TreatmentType? _selectedTreatmentStatus;

  @override
  void initState() {
    super.initState();
    _selectedTreatmentStatus = widget.initialSelectedStatus;
  }

  final Map<TreatmentType, String> statusLabels = {
    TreatmentType.opd: "ผู้ป่วยนอก",
    TreatmentType.ipdTreatment: "ผู้ป่วยใน (ระยะบำบัด)",
    TreatmentType.ipdRecover: "ผู้ป่วยใน (ระยะฟื้นฟู)",
    TreatmentType.ipdMini: "มินิธีญฯ",
    TreatmentType.cbtx: "CBTx",
    TreatmentType.network: "ภาคีเครือข่าย",
    TreatmentType.religious: "ศาสนสถาน",
  };

  final Map<TreatmentType, Color> statusColors = {
    TreatmentType.opd: MainColors.primary500,
    TreatmentType.ipdTreatment: MainColors.primary500,
    TreatmentType.ipdRecover: MainColors.primary500,
    TreatmentType.ipdMini: MainColors.primary500,
    TreatmentType.cbtx: MainColors.primary500,
    TreatmentType.network: MainColors.primary500,
    TreatmentType.religious: MainColors.primary500,
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
              _selectedTreatmentStatus = isSelected ? null : status;
            });
            widget.onSelected(_selectedTreatmentStatus);
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

class SmivTypeSelect extends StatefulWidget {
  final Function(SmivType?) onSelected;
  final SmivType? initialSelectedStatus;

  const SmivTypeSelect({
    super.key,
    required this.onSelected,
    this.initialSelectedStatus,
  });

  @override
  State<SmivTypeSelect> createState() => _SmivTypeSelectState();
}

class _SmivTypeSelectState extends State<SmivTypeSelect> {
  SmivType? _selectedSmiStatus;

  @override
  void initState() {
    super.initState();
    _selectedSmiStatus = widget.initialSelectedStatus;
  }

  final Map<SmivType, String> statusLabels = {
    SmivType.smiv: "SMI-V",
  };

  final Map<SmivType, Color> statusColors = {
    SmivType.smiv: MainColors.error,
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
              _selectedSmiStatus = isSelected ? null : status;
            });
            widget.onSelected(_selectedSmiStatus);
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
