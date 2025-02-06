import 'package:bst_staff_mobile/data/network/entity/dashboard-entity.dart';
import 'package:bst_staff_mobile/data/network/entity/login-entity.dart';
import 'package:bst_staff_mobile/data/network/entity/patient-entity.dart';
import 'package:bst_staff_mobile/data/network/entity/usersession-entity.dart';
import 'package:bst_staff_mobile/domain/exception/mapper-exception.dart';
import 'package:bst_staff_mobile/domain/model/appointments.dart';
import 'package:bst_staff_mobile/domain/model/dashboard.dart' as modelDashboard;
import 'package:bst_staff_mobile/domain/model/login.dart';
import 'package:bst_staff_mobile/domain/model/patient.dart';
import 'package:bst_staff_mobile/domain/model/session.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:logger/logger.dart';

class NetworkMapper {
  final Logger log;

  NetworkMapper({required this.log});

  // login
  Login toLogin(LoginEntity entity) {
    try {
      return Login(
        accessToken: entity.accessToken ?? "",
        refreshToken: entity.refreshToken ?? "",
        reqAuthenToken: entity.reqAuthenToken ?? "",
        loggedTooLong: entity.loggedTooLong ?? false,
        phoneNo: entity.phoneNo ?? "",
      );
    } catch (e) {
      throw MapperException<LoginEntity, Login>(
        e.toString(),
      );
    }
  }

  Session toUserSession(UserSessionEntity entity) {
    try {
      return Session(
        status: entity.status ?? "",
        webAgentId: entity.webAgentId ?? "",
        mobileDeviceId: entity.mobileDeviceId ?? "",
        loginAt: entity.loginAt ?? DateTime.now(),
      );
    } catch (e) {
      throw MapperException<LoginEntity, Login>(
        e.toString(),
      );
    }
  }

  // dashboard
  modelDashboard.StatYear toStatYear(
    StatYearEntity entity,
  ) {
    try {
      return modelDashboard.StatYear(
        year: entity.year,
        total: entity.total,
        register: entity.register,
        screening: entity.screening,
        treatment: entity.treatment,
        monitoring: entity.monitoring,
        discharged: entity.discharged,
      );
    } catch (e) {
      throw MapperException<LoginEntity, Login>(
        e.toString(),
      );
    }
  }

  modelDashboard.StatPatientWeek toStatPatientWeek(
    StatPatientWeekEntity entity,
    List<double> dataWeek,
  ) {
    try {
      return modelDashboard.StatPatientWeek(
        newPatientWeek: entity.newPatientWeek,
        dataWeek: dataWeek,
      );
    } catch (e) {
      throw MapperException<LoginEntity, Login>(
        e.toString(),
      );
    }
  }

  modelDashboard.StatPatientMonth toStatPatientMonth(
    StatPatientMonthEntity entity,
    List<double> dataMonth,
  ) {
    try {
      return modelDashboard.StatPatientMonth(
        newPatientMonth: entity.newPatientMonth,
        dataMonth: dataMonth,
      );
    } catch (e) {
      throw MapperException<LoginEntity, Login>(
        e.toString(),
      );
    }
  }

  modelDashboard.Refer toRefer(
    ReferEntity entity,
  ) {
    try {
      return modelDashboard.Refer(
        sender: entity.sender,
        receiver: entity.receiver,
      );
    } catch (e) {
      throw MapperException<LoginEntity, Login>(
        e.toString(),
      );
    }
  }

  modelDashboard.Level toLevel(
    LevelEntity entity,
  ) {
    try {
      final currentYear = DateTime.now().year;
      final modelDashboard.Level model = modelDashboard.Level(
        year: entity.fiscalYear ?? currentYear,
        screeningTotal: convertToInt(entity.screening?.URGENCY.count) +
            convertToInt(entity.screening?.EMERGENCY.count) +
            convertToInt(entity.screening?.SEMI_URGENCY.count) +
            convertToInt(entity.screening?.NORMAL.count),
        screeningUrgencyCount: convertToInt(entity.screening?.URGENCY.count),
        screeningUrgencyPercent:
            convertToDouble(entity.screening?.URGENCY.percentage),
        screeningEmergencyCount:
            convertToInt(entity.screening?.EMERGENCY.count),
        screeningEmergencyPercent:
            convertToDouble(entity.screening?.EMERGENCY.percentage),
        screeningSemiUrgencyCount:
            convertToInt(entity.screening?.SEMI_URGENCY.count),
        screeningSemiUrgencyPercent:
            convertToDouble(entity.screening?.SEMI_URGENCY.percentage),
        screeningNormalCount: convertToInt(entity.screening?.NORMAL.count),
        screeningNormalPercent:
            convertToDouble(entity.screening?.NORMAL.percentage),
        treatmentTotal: convertToInt(entity.treatment?.URGENCY.count) +
            convertToInt(entity.treatment?.EMERGENCY.count) +
            convertToInt(entity.treatment?.SEMI_URGENCY.count) +
            convertToInt(entity.treatment?.NORMAL.count),
        treatmentUrgencyCount: convertToInt(entity.treatment?.URGENCY.count),
        treatmentUrgencyPercent:
            convertToDouble(entity.treatment?.URGENCY.percentage),
        treatmentEmergencyCount:
            convertToInt(entity.treatment?.EMERGENCY.count),
        treatmentEmergencyPercent:
            convertToDouble(entity.treatment?.EMERGENCY.percentage),
        treatmentSemiUrgencyCount:
            convertToInt(entity.treatment?.SEMI_URGENCY.count),
        treatmentSemiUrgencyPercent:
            convertToDouble(entity.treatment?.SEMI_URGENCY.percentage),
        treatmentNormalCount: convertToInt(entity.treatment?.NORMAL.count),
        treatmentNormalPercent:
            convertToDouble(entity.treatment?.NORMAL.percentage),
      );
      return model;
    } catch (e) {
      throw MapperException<LoginEntity, Login>(
        e.toString(),
      );
    }
  }
}
