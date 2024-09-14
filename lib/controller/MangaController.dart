import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http ;
import '../object/Manga.dart' ;

class MangaController extends GetxController {
  RxList<Manga> mangas = RxList([]);

  @override
  void onInit () {
    getManga();
    super.onInit();
  }

  getManga () async{
    try{
      mangas.value = [];
      var response = await http.get(Uri.parse("https://mangapi-man.vercel.app/manga"));
      for(Map<String,dynamic> manga in jsonDecode(response.body)){
        mangas.add(Manga.fromJson(manga));
      }
    }catch(e){
      print(e.toString());
    }
  }

}