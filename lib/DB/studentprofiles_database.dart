import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/model/student.dart';

class StudentsDatabase {
  static final StudentsDatabase instance = StudentsDatabase._init();
  static Database? _database;

  StudentsDatabase._init();

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
    final idType = 'INTEGER PRIMARY KEY';
    final nameType = "TEXT";
    final ageType = "INTEGER";
    final universityIDType = "INTEGER";
    final programIDType = "INTEGER";
    final yearType = "INTEGER";
    final cityType = "TEXT";
    final imageType = "BLOB";

    print("creating database");

    await db.execute('''
      CREATE TABLE $tableStudents(
        ${StudentFields.id} $idType,
        ${StudentFields.name} $nameType,
        ${StudentFields.age} $ageType,
        ${StudentFields.universityID} $universityIDType,
        ${StudentFields.programID} $programIDType,
        ${StudentFields.year} $yearType,
        ${StudentFields.city} $cityType,
        ${StudentFields.image} $imageType,

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

  Future<int> addStudent (Student student) async{
    final db = await instance.database;
    //final id = await db.insert(tableUsers, user.toJson());
    final id = await db.insert(tableStudents, student.toMap());
    return id;
  }

  Future close() async{
    final db = await instance.database;
    db.close();
  }


// You can define your database operations here, like inserting, updating, or querying data.
}
