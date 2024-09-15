import 'dart:convert';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/model/Catatan.dart';

class CatatanController extends GetxController {
  RxList<Catatan> catans = RxList([]);
  Database? db;

  @override
  void onInit () {
    connectDB();
    super.onInit();
  }

  connectDB () async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath,"catan.db");
    db = await openDatabase(path,
      version: 1,
      onCreate: (db,version){
        return db.execute("CREATE TABLE catan (id INTEGER PRIMARY KEY AUTOINCREMENT, nama STRING, isi TEXT)");
      }
    );
    // await insertCatan(Catatan(nama: "kadua", isi: "nama saya shiva"));
    // await updateCatan(Catatan(id: 1,nama: "pertama",isi: "nama saya shiva"));
    // await deleteCatan(2);
    await this.listCatan();
    print(catans);
  }

  insertCatan (Catatan catatan) async {
    await db?.insert("catan",catatan.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  listCatan () async {
    final List<Map<String, Object?>>? datas = await db?.query("catan");

    if(datas == null){
      print("tidak ada");
      return [];
    }

    for(final catan in datas){
      catans.add(Catatan.fromJson(catan));
    }
  }

  updateCatan (Catatan catatan) async {
    await db?.update("catan",catatan.toJson(),where:"id = ?",whereArgs: [catatan.id]);
  }

  deleteCatan (int id) async {
    await db?.delete("catan",where: "id = ?",whereArgs: [id]);
  }

}