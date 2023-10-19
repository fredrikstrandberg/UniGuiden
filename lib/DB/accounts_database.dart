import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/model/account.dart';

class AccountDatabase {
  static final AccountDatabase instance = AccountDatabase._init();
  static Database? _database;

  AccountDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB("accounts.db");
    return _database!;
  }

  Future<Database> _initDB(String filename) async {
    print("init körs");
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
    final emailType = "TEXT NOT NULL UNIQUE";
    final passwordType = "TEXT";
    final nameType = "TEXT";
    final birthdateType = "TEXT";


    print("creating database");

    await db.execute('''
      CREATE TABLE $tableAccounts(
        ${AccountFields.id} $idType,
        ${AccountFields.email} $emailType,
        ${AccountFields.password} $passwordType,
        ${AccountFields.name} $nameType, 
        ${AccountFields.birthdate} $birthdateType
      )
    ''');

    print("created database");

    //Account user1 = Account(id: 10, email: 'jesper.senke@gmail.com', password: '123', name: 'Jesper', birthdate: '19990810');
    // User user2 = User(id: 11, username: 'fredrik', password: '123');
    // User admin1 = User(id: 12, username: 'admin', password: '123');
    //await addAccount(user1);
    // await addUser(user2);
    // await addUser(admin1);

  }

  Future <Account> addAccount (Account account) async{
    final db = await instance.database;
    //final id = await db.insert(tableUsers, user.toJson());
    final id = await db.insert(tableAccounts, account.toMap());
    return account.copy(id:id);
  }

  Future<bool> correctLogin(String username, String password) async {
    final db = await instance.database;
    final result = await db.query(
      tableAccounts,
      where: '${AccountFields.email} = ? AND ${AccountFields.password} = ?',
      whereArgs: [username, password],
    );
    return result.isNotEmpty; // Return true if there's a matching user.
  }

  Future<bool> okEmail(String email) async {
    print("inside checkEmail");
    final db = await instance.database;
    print("db hämtad");
    final result = await db.query(
      tableAccounts,
      where: '${AccountFields.email} = ?',
      whereArgs: [email],
    );
    print("returning");
    return result.isNotEmpty; // Return true if there's a matching user.
  }

  Future close() async{
    final db = await instance.database;
    db.close();
  }


// You can define your database operations here, like inserting, updating, or querying data.
}
