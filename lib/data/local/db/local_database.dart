// import 'package:flutter/cupertino.dart';
// import 'package:path/path.dart';
// import 'package:rest_api/data/model/phone/phone_model.dart';
// import 'package:sqflite/sqflite.dart';
//
// class LocalDatabase {
//   static final LocalDatabase getInstance = LocalDatabase._init();
//
//   LocalDatabase._init();
//
//   factory LocalDatabase() {
//     return getInstance;
//   }
//
//   static Database? _database;
//
//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     } else {
//       _database = await _initDB("contacts.db");
//       return _database!;
//     }
//   }
//
//   Future<Database> _initDB(String dbName) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, dbName);
//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }
//
//   Future _createDB(Database db, int version) async {
//     const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
//     const textType = "TEXT NOT NULL";
//     const intType = "INTEGER DEFAULT 0";
//
//     await db.execute('''
//     CREATE TABLE ${PhoneModelFields.phoneTable} (
//     ${PhoneModelFields.id} $idType,
//     ${PhoneModelFields.name} $textType,
//     ${PhoneModelFields.data} $textType
//     )
//     ''');
//
//     debugPrint("-------DB----------CREATED---------");
//   }
//
//   static Future<PhoneModel> insertContact(PhoneModel phoneModel) async {
//     final db = await getInstance.database;
//     final int id =
//         await db.insert(PhoneModelFields.phoneTable, phoneModel.toJson());
//     return phoneModel.copyWith(id: "id");
//   }
//
//   static Future<List<PhoneModel>> getAllContacts() async {
//     List<PhoneModel> allToDos = [];
//     final db = await getInstance.database;
//     allToDos = (await db.query(PhoneModelFields.phoneTable))
//         .map((e) => PhoneModel.fromJson(e))
//         .toList();
//
//     return allToDos;
//   }
//
//   static updateContactName({required int id, required String name}) async {
//     final db = await getInstance.database;
//     db.update(
//       PhoneModelFields.phoneTable,
//       {PhoneModelFields.name: name},
//       where: "${PhoneModelFields.id} = ?",
//       whereArgs: [id],
//     );
//   }
//
//   static updateContact({required PhoneModel phoneModelSql}) async {
//     final db = await getInstance.database;
//     db.update(
//       PhoneModelFields.phoneTable,
//       phoneModelSql.toJson(),
//       where: "${PhoneModelFields.id} = ?",
//       whereArgs: [phoneModelSql.id],
//     );
//   }
//
//   static Future<int> deleteContact(int id) async {
//     final db = await getInstance.database;
//     int count = await db.delete(
//       PhoneModelFields.phoneTable,
//       where: "${PhoneModelFields.id} = ?",
//       whereArgs: [id],
//     );
//     return count;
//   }
//
//   static Future<List<PhoneModel>> getContactsByLimit(int limit) async {
//     List<PhoneModel> allToDos = [];
//     final db = await getInstance.database;
//     allToDos = (await db.query(PhoneModelFields.phoneTable,
//             limit: limit, orderBy: "${PhoneModelFields.name} ASC"))
//         .map((e) => PhoneModel.fromJson(e))
//         .toList();
//
//     return allToDos;
//   }
//
//   static Future<PhoneModel?> getSingleContact(int id) async {
//     List<PhoneModel> contacts = [];
//     final db = await getInstance.database;
//     contacts = (await db.query(
//       PhoneModelFields.phoneTable,
//       where: "${PhoneModelFields.id} = ?",
//       whereArgs: [id],
//     ))
//         .map((e) => PhoneModel.fromJson(e))
//         .toList();
//
//     if (contacts.isNotEmpty) {
//       return contacts.first;
//     }
//     return null;
//   }
//
//   static Future<List<PhoneModel>> getContactsByAlphabet(String order) async {
//     List<PhoneModel> allToDos = [];
//     final db = await getInstance.database;
//     allToDos = (await db.query(PhoneModelFields.phoneTable,
//             orderBy: "${PhoneModelFields.name} $order"))
//         .map((e) => PhoneModel.fromJson(e))
//         .toList();
//     return allToDos;
//   }
//
//   static Future<List<PhoneModel>> getContactsByQuery(String query) async {
//     List<PhoneModel> allToDos = [];
//     final db = await getInstance.database;
//     allToDos = (await db.query(
//       PhoneModelFields.phoneTable,
//       where: "${PhoneModelFields.name} LIKE ?",
//       whereArgs: [query],
//     ))
//         .map((e) => PhoneModel.fromJson(e))
//         .toList();
//     return allToDos;
//   }
// }
