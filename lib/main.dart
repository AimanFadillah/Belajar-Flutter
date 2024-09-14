import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:untitled/controller/MangaController.dart';

void main(){
  runApp(
      const GetMaterialApp(
        title: "Homepage",
        debugShowCheckedModeBanner: false,
        home:SafeArea(child: MyApp())
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manga",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions:const [
          IconButton(onPressed: null, icon: const Icon(Icons.search,color: Colors.white),tooltip: "Cari Catatan")
        ],
      ),
      body:BodyApp(),
      floatingActionButton:const FloatingActionButton(
          onPressed: null,
          tooltip: "Tambah Catatan",
          child:Icon(Icons.add)
      ),
    );
  }
}

class BodyApp extends StatelessWidget{
  const BodyApp ({super.key});
  @override
  Widget build(BuildContext context) {
    final mangaController = Get.put(MangaController());
    return Obx(() => GridView.builder(
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
      ),
      shrinkWrap: true,
      itemCount: mangaController.mangas.length,
      itemBuilder: (context,i) {
        final manga = mangaController.mangas[i];
        return Column(
          children:[
            Expanded(child: Image.network("https://mangapi-man.vercel.app/gambar?url=${manga.gambar}")),
            Text(truncateText(manga.judul as String)),
          ]
        );
      },
    ));
  }
}

String truncateText(String text, {int cutoff = 20}) {
  if (text.length <= cutoff) {
    return text;
  } else {
    return '${text.substring(0, cutoff)}...';
  }
}

