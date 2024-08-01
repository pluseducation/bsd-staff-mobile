import 'package:bst_staff_mobile/data/network/entity/dashboard-entity.dart';
import 'package:bst_staff_mobile/data/network/entity/login-entity.dart';
import 'package:bst_staff_mobile/domain/exception/mapper-exception.dart';
import 'package:bst_staff_mobile/domain/model/dashboard.dart';
import 'package:bst_staff_mobile/domain/model/login.dart';
import 'package:logger/logger.dart';

class NetworkMapper {
  final Logger log;

  NetworkMapper({required this.log});

  // login
  Login toLogin(LoginEntity entity) {
    try {
      return Login(
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
        loggedTooLong: entity.loggedTooLong,
        phoneNo: entity.phoneNo,
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
    double registerPercent,
    double screeningPercent,
    double treatmentPercent,
    double monitoringPercent,
    double dischargedPercent,
  ) {
    try {
      return StatYear(
        year: entity.year,
        total: entity.total,
        register: entity.register,
        registerPercent: registerPercent,
        screening: entity.screening,
        screeningPercent: screeningPercent,
        treatment: entity.treatment,
        treatmentPercent: treatmentPercent,
        monitoring: entity.monitoring,
        monitoringPercent: monitoringPercent,
        discharged: entity.discharged,
        dischargedPercent: dischargedPercent,
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
}
