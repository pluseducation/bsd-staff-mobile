import 'package:bst_staff_mobile/data/database/database-mapper.dart';
import 'package:bst_staff_mobile/data/datasource/preferences.dart';
import 'package:bst_staff_mobile/data/network/api/base-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:mocktail/mocktail.dart';

class ApiClientMock extends Mock implements BaseApi {}

class NetworkMapperMock extends Mock implements NetworkMapper {}

class DatabaseMapperMock extends Mock implements DatabaseMapper {}

class PreferencesMock extends Mock implements Preferences {}
