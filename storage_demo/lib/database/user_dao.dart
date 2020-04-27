import 'abstract_database_provider.dart';
import '../models/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDao extends DatabaseProvider {
  @override
  createTableSql() {
    return "CREATE TABLE t_user ("
        "id INTEGER PRIMARY KEY, "
        "nickname TEXT,"
        "mobile TEXT,"
        "avatar TEXT"
        ")";
  }

  @override
  tableName() {
    return 't_user';
  }

  Future<User> findByUserId(int userId) async {
    Database database = await getDatabase();
    var rawUser =
        await database.query(tableName(), where: "id = ?", whereArgs: [userId]);

    if (rawUser.isNotEmpty) {
      return User.fromJson(rawUser.first);
    }

    return null;
  }

/*
 * 插入一条数据
 * 成功返回插入数据的id，失败返回0 
 */
  Future<int> insertUser(User user) async {
    User oldUser = await findByUserId(user.id);
    if (oldUser != null) {
      // 'Duplicated id found in ${tableName()}';
      return 0;
    }

    Database database = await getDatabase();

    var raw = await database.rawInsert(
        "INSERT INTO ${tableName()} (id, nickname, mobile, avatar) "
        "VALUES (?, ?, ?, ?)",
        [user.id, user.nickname, user.mobile, user.avatar]);

    if (raw != null) {
      return user.id;
    } else {
      return 0;
    }
  }

/*
 * 根据userId删除记录
 * 成功返回删除的条数，失败返回0
 */
  Future<int> deleteByUserId(int userId) async {
    User oldUser = await findByUserId(userId);
    if (oldUser != null) {
      // 'User  not found in ${tableName()}';
      return 0;
    }

    Database database = await getDatabase();
    var delete = await database
        .delete(tableName(), where: "id = ?", whereArgs: [userId]);

    return delete;
  }

  Future<int> updateUser(User user) async {
    User oldUser = await findByUserId(user.id);
    if (oldUser != null) {
      // 'User not found in ${tableName()}';
      return 0;
    }

    Database database = await getDatabase();
    var update = await database.update(tableName(), user.toJson(), where: 'id = ?', whereArgs: [user.id]);

    return update;
  }

  Future<List<User>> listAllUsers() async {
    Database database = await getDatabase();
    var res = await database.query(tableName());
    if (res.isNotEmpty && res.length > 0) {
      return res.map((item) => User.fromJson(item)).toList();
    } else {
      return [];
    }
  }
}
