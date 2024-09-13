import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'controller/MainController.dart';

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
    final mainController = Get.put(MainController());
    return Scaffold(
      appBar: AppBar(
        title:Obx(() => Text("Catan ${mainController.count}",style: TextStyle(color: Colors.white,fontSize: 20))),
        backgroundColor: Colors.purple,
        actions:[
          IconButton(onPressed: () => Get.to(Other()), icon: const Icon(Icons.search,color: Colors.white),tooltip: "Cari Catatan")
        ],
      ),
      body:const BodyApp(),
      floatingActionButton:FloatingActionButton(
          onPressed: () {
            mainController.increment();
          },
          tooltip: "Tambah Catatan",
          child:const Icon(Icons.add)
      ),
    );
  }
}

class BodyApp extends StatelessWidget{
  const BodyApp ({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Hello word ke"),
    );
  }
}

class Other extends StatelessWidget {
  const Other ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 2"),
      ),
    );    
  }
}
