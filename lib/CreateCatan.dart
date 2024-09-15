import 'package:flutter/material.dart';
import 'package:untitled/controller/CatatanController.dart';
import 'package:get/get.dart';
import 'package:untitled/model/Catatan.dart';

class CreateCatan extends StatelessWidget{
  const CreateCatan({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nama = TextEditingController();
    TextEditingController isi = TextEditingController();
    final catatanController = Get.put(CatatanController());
    return Scaffold(
      appBar: AppBar(
        title:const Text("Create Catan",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        margin:const EdgeInsets.fromLTRB(0,20,0,0),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            TextField(
              controller: nama,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Judul Catatan",
                label: Text("Judul Catatan"),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: isi,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Isi Catatan",
                label: Text("Isi Catatan"),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await catatanController.insertCatan(Catatan(nama: nama.text,isi: isi.text));
                Get.offAllNamed("/");
              },
              child:const Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}