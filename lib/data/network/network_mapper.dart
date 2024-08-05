import 'package:bst_staff_mobile/data/network/entity/dashboard-entity.dart';
import 'package:bst_staff_mobile/data/network/entity/login-entity.dart';
import 'package:bst_staff_mobile/data/network/entity/patient-entity.dart';
import 'package:bst_staff_mobile/data/network/entity/usersession-entity.dart';
import 'package:bst_staff_mobile/domain/exception/mapper-exception.dart';
import 'package:bst_staff_mobile/domain/model/dashboard.dart';
import 'package:bst_staff_mobile/domain/model/login.dart';
import 'package:bst_staff_mobile/domain/model/patient.dart';
import 'package:bst_staff_mobile/domain/model/session.dart';
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
  StatYear toStatYear(
    StatYearEntity entity,
  ) {
    try {
      return StatYear(
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

  StatPatientWeek toStatPatientWeek(
    StatPatientWeekEntity entity,
    List<double> dataWeek,
  ) {
    try {
      return StatPatientWeek(
        newPatientWeek: entity.newPatientWeek,
        dataWeek: dataWeek,
      );
    } catch (e) {
      throw MapperException<LoginEntity, Login>(
        e.toString(),
      );
    }
  }

  StatPatientMonth toStatPatientMonth(
    StatPatientMonthEntity entity,
    List<double> dataMonth,
  ) {
    try {
      return StatPatientMonth(
        newPatientMonth: entity.newPatientMonth,
        dataMonth: dataMonth,
      );
    } catch (e) {
      throw MapperException<LoginEntity, Login>(
        e.toString(),
      );
    }
  }

  Refer toRefer(
    ReferEntity entity,
  ) {
    try {
      return Refer(
        sender: entity.sender,
        receiver: entity.receiver,
      );
    } catch (e) {
      throw MapperException<LoginEntity, Login>(
        e.toString(),
      );
    }
  }

  // patient
  PatientAll toPatientAll(PatientAllEntity entity) {
    try {
      final List<Patient> content = toPatients(entity.content);

      return PatientAll(
        content: content,
        totalPages: entity.totalPages,
        totalElements: entity.totalElements,
      );
    } catch (e) {
      throw MapperException<PatientEntity, Patient>(
        e.toString(),
      );
    }
  }

  List<Patient> toPatients(List<PatientEntity> entities) {
    final List<Patient> values = [];

    for (final entity in entities) {
      try {
        values.add(toPatient(entity));
      } catch (e) {
        log.w('Could not map entity ${entity.patientId}', error: e);
      }
    }

    return values;
  }

  Patient toPatient(PatientEntity entity) {
    try {
      return Patient(
        patientId: entity.patientId,
        fullName: "${entity.name} ${entity.surname}",
        nationalId: entity.nationalId,
        cycle: entity.cycle == null ? "" : entity.cycle.toString(),
        status:
            entity.status == null ? "REGISTERIMG" : entity.status.toString(),
      );
    } catch (e) {
      throw MapperException<PatientEntity, Patient>(
        e.toString(),
      );
    }
  }
}
