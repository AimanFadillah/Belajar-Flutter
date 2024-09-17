import "package:flutter/material.dart";
import "package:untitled/CreateCatan.dart";
import "package:untitled/component/ListCatan.dart";
import "package:untitled/controller/CatatanController.dart";
import 'package:get/get.dart';

void main(){
  runApp(
      GetMaterialApp(
        title: "Homepage",
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        getPages: [
          GetPage(name: "/",page: () => const MyApp()),
          GetPage(name: "/create", page: () => const CreateCatan())
        ],
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Catan",style: TextStyle(color: Colors.white,fontSize: 20)),
        backgroundColor: Colors.purple,
      ),
      body:const BodyApp(),
      floatingActionButton:FloatingActionButton(
          onPressed: (){
            Get.toNamed("/create");
          },
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
    final catatanController = Get.put(CatatanController());
    return Obx(() =>
        catatanController.loading.value ?
        const Center(
            child: CircularProgressIndicator()
        ) :
        SingleChildScrollView(
          child: Column(
            children: catatanController.catans.map((catan) {
              return ListCatan(catan: catan);
            }).toList(),
          ),
        )
    );
  }
}


