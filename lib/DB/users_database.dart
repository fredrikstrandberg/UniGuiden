import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/model/user.dart';

class UsersDatabase {
  static final UsersDatabase instance = UsersDatabase._init();
  static Database? _database;

  UsersDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB("users.db");
    return _database!;
  }

  Future<Database> _initDB(String filename) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filename);

    // Open the database, create it if it doesn't exist
    return await openDatabase(
      path,
      version: 1, // You can change the database version if needed
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    // You can define the database schema and initial tables here.
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final usernameType = "TEXT NOT NULL UNIQUE";
    final passwordType = "TEXT";

    await db.execute('''
      CREATE TABLE $tableUsers(
        ${UserFields.id} $idType,
        ${UserFields.username} $usernameType,
        ${UserFields.password} $passwordType,
      )
    ''');
    User user1 = User(id: 10, username: 'jesper', password: '123');
    User user2 = User(id: 11, username: 'fredrik', password: '123');
    await addUser(user1);
    await addUser(user2);
  }

  Future <User> addUser (User user) async{
    final db = await instance.database;
    //final id = await db.insert(tableUsers, user.toJson());
    final id = await db.insert(tableUsers, user.toMap());
    return user.copy(id:id);
  }

  Future<bool> checkLogin(String username, String password) async {
    final db = await instance.database;
    final result = await db.query(
      tableUsers,
      where: '${UserFields.username} = ? AND ${UserFields.password} = ?',
      whereArgs: [username, password],
    );
    return result.isNotEmpty; // Return true if there's a matching user.
  }

  Future close() async{
    final db = await instance.database;
    db.close();
  }


// You can define your database operations here, like inserting, updating, or querying data.
}
