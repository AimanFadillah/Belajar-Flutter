import "package:flutter/material.dart";
import "package:untitled/controller/CatatanController.dart";
import 'package:get/get.dart';

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
        title:const Text("Catan",style: TextStyle(color: Colors.white,fontSize: 20)),
        backgroundColor: Colors.purple,
      ),
      body:const BodyApp(),
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
    final catatanController = Get.put(CatatanController());
    return SingleChildScrollView(
      child: Column(
        children: List.generate(100,(index) =>
          ListTile(
            title: Text("aku ke ${index + 1}"),
            subtitle: Text("ini adalah list yang ke ${index + 1}"),
            leading: const Icon(Icons.mail),
          )
        ),
      ),
    );
  }
}
