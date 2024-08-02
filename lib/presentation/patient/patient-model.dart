import 'package:bst_staff_mobile/data/repository/patient-repository.dart';
import 'package:bst_staff_mobile/domain/model/patient.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:logger/logger.dart';

class PatientModel {
  final Logger log;
  final PatientRepository patientRepository;
  final AppService appService;

  PatientModel({
    required this.log,
    required this.patientRepository,
    required this.appService,
  });

  List<PatientData> patients = List.empty();
  int page = 0;
  int size = 50;
  String name = "";
  String sort = "";

  Future<List<PatientData>> loadData() async {
    List<PatientData> tempData = [
      PatientData(
        name: "มาลี ใจดี",
        cardnumber: "1579900499231",
        therapy: "รอบบำบัด: 0210",
        imagePath: "assets/images/profile2.png",
        status: "ลงทะเบียน",
      ),
      PatientData(
        name: "สมหญิง ประกอบ11",
        cardnumber: "1479900496542",
        therapy: "รอบบำบัด: 0110",
        imagePath: "assets/images/profile2.png",
        status: "คัดกรอง",
      ),
    ];

    if (name.isNotEmpty) {
      return tempData.where((patient) => patient.name.contains(name)).toList();
    }

    return tempData;
  }

  Future<PatientAll> test() async {
    return patientRepository.findPatientAll(searchVal: name, page: page);
  }
}

class PatientData {
  PatientData({
    required this.name,
    required this.cardnumber,
    required this.therapy,
    required this.imagePath,
    required this.status,
  });

  final String name;
  final String cardnumber;
  final String therapy;
  final String imagePath;
  final String status;
}
