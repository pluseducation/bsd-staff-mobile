import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/data/network/entity/master-entity.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:dio/dio.dart';

class MasterApi extends BaseApi {
  MasterApi({required super.baseUrl});

  Future<List<NationalityEntity>> findNationality() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get('/api/v1/master/nationalities');

      if (response.statusCode == 200) {
        return nationalitiesFromJson(
          response.data as List,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.statusMessage,
        );
      } else {
        throw NetworkException(
          statusCode: 404,
          message: "ไม่สามารถเชื่อมต่อ Internet ได้",
        );
      }
    } catch (error) {
      throw Exception('Unknown error : $error');
    }
  }

  Future<List<ReligionsEntity>> findReligions() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get('/api/v1/master/religions');

      if (response.statusCode == 200) {
        return religionsFromJson(
          response.data as List,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.statusMessage,
        );
      } else {
        throw NetworkException(
          statusCode: 404,
          message: "ไม่สามารถเชื่อมต่อ Internet ได้",
        );
      }
    } catch (error) {
      throw Exception('Unknown error : $error');
    }
  }

  Future<List<RelationshipsEntity>> findRelationships() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get('/api/v1/master/parentrelationships');

      if (response.statusCode == 200) {
        return relationshipsFromJson(
          response.data as List,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.statusMessage,
        );
      } else {
        throw NetworkException(
          statusCode: 404,
          message: "ไม่สามารถเชื่อมต่อ Internet ได้",
        );
      }
    } catch (error) {
      throw Exception('Unknown error : $error');
    }
  }

  Future<List<VillagesEntity>> findVillages() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get('/api/v1/master/villages');

      if (response.statusCode == 200) {
        return villagesFromJson(
          response.data as List,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.statusMessage,
        );
      } else {
        throw NetworkException(
          statusCode: 404,
          message: "ไม่สามารถเชื่อมต่อ Internet ได้",
        );
      }
    } catch (error) {
      throw Exception('Unknown error : $error');
    }
  }

  Future<List<ProvincesEntity>> findProvinces() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get('/api/v1/master/provinces');

      if (response.statusCode == 200) {
        return provincesFromJson(
          response.data as List,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.statusMessage,
        );
      } else {
        throw NetworkException(
          statusCode: 404,
          message: "ไม่สามารถเชื่อมต่อ Internet ได้",
        );
      }
    } catch (error) {
      throw Exception('Unknown error : $error');
    }
  }

  Future<List<DistrictsEntity>> findDistricts() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get('/api/v1/master/districts');

      if (response.statusCode == 200) {
        return districtsFromJson(
          response.data as List,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.statusMessage,
        );
      } else {
        throw NetworkException(
          statusCode: 404,
          message: "ไม่สามารถเชื่อมต่อ Internet ได้",
        );
      }
    } catch (error) {
      throw Exception('Unknown error : $error');
    }
  }

  Future<List<EducationsEntity>> findEducations() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get('/api/v1/master/educations');

      if (response.statusCode == 200) {
        return educationsFromJson(
          response.data as List,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.statusMessage,
        );
      } else {
        throw NetworkException(
          statusCode: 404,
          message: "ไม่สามารถเชื่อมต่อ Internet ได้",
        );
      }
    } catch (error) {
      throw Exception('Unknown error : $error');
    }
  }

  Future<List<OccupationsEntity>> findOccupations() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get('/api/v1/master/occupations');

      if (response.statusCode == 200) {
        return occupationsFromJson(
          response.data as List,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.statusMessage,
        );
      } else {
        throw NetworkException(
          statusCode: 404,
          message: "ไม่สามารถเชื่อมต่อ Internet ได้",
        );
      }
    } catch (error) {
      throw Exception('Unknown error : $error');
    }
  }

  Future<List<IncomesEntity>> findIncomes() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get('/api/v1/master/incomes');

      if (response.statusCode == 200) {
        return IncomesFromJson(
          response.data as List,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.statusMessage,
        );
      } else {
        throw NetworkException(
          statusCode: 404,
          message: "ไม่สามารถเชื่อมต่อ Internet ได้",
        );
      }
    } catch (error) {
      throw Exception('Unknown error : $error');
    }
  }

  Future<List<SubdistrictsEntity>> findSubdistricts() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get('/api/v1/master/subdistricts');

      if (response.statusCode == 200) {
        return subdistrictsFromJson(
          response.data as List,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.statusMessage,
        );
      } else {
        throw NetworkException(
          statusCode: 404,
          message: "ไม่สามารถเชื่อมต่อ Internet ได้",
        );
      }
    } catch (error) {
      throw Exception('Unknown error : $error');
    }
  }

  Future<List<MaritalstatusesEntity>> findMaritalstatuses() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get('/api/v1/master/maritalstatuses');

      if (response.statusCode == 200) {
        return maritalstatusesFromJson(
          response.data as List,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.statusMessage,
        );
      } else {
        throw NetworkException(
          statusCode: 404,
          message: "ไม่สามารถเชื่อมต่อ Internet ได้",
        );
      }
    } catch (error) {
      throw Exception('Unknown error : $error');
    }
  }

  Future<List<RelationshipsValueEntity>> findRelationshipsvalue() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get('/api/v1/master/relationships');

      if (response.statusCode == 200) {
        return relationshipsvalueFromJson(
          response.data as List,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.statusMessage,
        );
      } else {
        throw NetworkException(
          statusCode: 404,
          message: "ไม่สามารถเชื่อมต่อ Internet ได้",
        );
      }
    } catch (error) {
      throw Exception('Unknown error : $error');
    }
  }

  Future<List<DrugsEntity>> findDrugs() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get('/api/v1/master/drugs');

      if (response.statusCode == 200) {
        return drugsFromJson(
          response.data as List,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.statusMessage,
        );
      } else {
        throw NetworkException(
          statusCode: 404,
          message: "ไม่สามารถเชื่อมต่อ Internet ได้",
        );
      }
    } catch (error) {
      throw Exception('Unknown error : $error');
    }
  }

  Future<List<MentaltreatmentsEntity>> findMentaltreatments() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get('/api/v1/master/mentaltreatments');

      if (response.statusCode == 200) {
        return mentaltreatmentsFromJson(
          response.data as List,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.statusMessage,
        );
      } else {
        throw NetworkException(
          statusCode: 404,
          message: "ไม่สามารถเชื่อมต่อ Internet ได้",
        );
      }
    } catch (error) {
      throw Exception('Unknown error : $error');
    }
  }

  Future<List<MriminalcasesEntity>> findcriminalcases() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get('/api/v1/master/criminalcases');

      if (response.statusCode == 200) {
        return criminalcasesFromJson(
          response.data as List,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.statusMessage,
        );
      } else {
        throw NetworkException(
          statusCode: 404,
          message: "ไม่สามารถเชื่อมต่อ Internet ได้",
        );
      }
    } catch (error) {
      throw Exception('Unknown error : $error');
    }
  }

  // /master/chroniccontagiouses

  Future<List<ChroniccontagiousesEntity>> findChroniccontagiouses() async {
    try {
      final Dio dio = await getPrivateDio();
      final response = await dio.get('/api/v1/master/chroniccontagiouses');

      if (response.statusCode == 200) {
        return chroniccontagiousesFromJson(
          response.data as List,
        );
      } else {
        throw Exception('Unknown error');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.statusMessage,
        );
      } else {
        throw NetworkException(
          statusCode: 404,
          message: "ไม่สามารถเชื่อมต่อ Internet ได้",
        );
      }
    } catch (error) {
      throw Exception('Unknown error : $error');
    }
  }
}
