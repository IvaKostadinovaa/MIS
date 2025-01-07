import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/event.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;

  static Database? _database;

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'events.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
  CREATE TABLE events(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    description TEXT,
     dateTime TEXT,  
    latitude REAL,
    longitude REAL
  )
''');

      },
    );
  }

  Future<int> insertEvent(Event event) async {
    final db = await database;
    return await db.insert('events', event.toMap());
  }

  Future<List<Event>> getEventsByDate(String date) async {
    final db = await database;
    final result = await db.query('events', where: 'date = ?', whereArgs: [date]);
    return result.map((e) => Event.fromMap(e)).toList();
  }
}
