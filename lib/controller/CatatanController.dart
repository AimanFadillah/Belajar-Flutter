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
    // await insertCatan(Catatan(nama: "hai", isi: "nama saya shova"));
    await listCatan();
    print(await catans.value);
  }

  // insertCatan (Catatan catatan) async {
  //   await db?.insert("catan",catatan.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  // }

    listCatan () async {
      final List<Map<String, Object?>>? datas = await db?.query("catan");
      String json = jsonEncode(datas);

      if(datas == null){
        print("tidak ada");
        return [];
      }

      for(final catan in jsonDecode(json)){
        catans.add(Catatan.fromJson(catan));
      }
    }


}