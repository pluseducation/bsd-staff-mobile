import 'package:bst_staff_mobile/data/database/dao/base-dao.dart';
import 'package:bst_staff_mobile/data/database/entity/login-db-entity.dart';
import 'package:sqflite/sqflite.dart';

class LoginDao extends BaseDao {
  Future<LoginDbEntity?> find() async {
    final Database db = await getDb();
    final List<Map<String, dynamic>> maps = await db.query(
      BaseDao.loginTableName,
      limit: 1, // Limit the query to only one row
    );

    if (maps.isNotEmpty) {
      return LoginDbEntity.fromJson(maps.first);
    } else {
      return null; // Handle the case where no rows are found
    }
  }

  Future<void> insert(LoginDbEntity entity) async {
    final Database db = await getDb();
    await db.insert(BaseDao.loginTableName, entity.toJson());
  }

  Future<void> deleteAll() async {
    final Database db = await getDb();
    await db.delete(BaseDao.loginTableName);
  }
}
