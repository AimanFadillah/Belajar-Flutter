import "package:flutter/material.dart";

void main(){
  runApp(
      const MaterialApp(
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
        actions:const [
          IconButton(onPressed: null, icon: Icon(Icons.search,color: Colors.white),tooltip: "Cari Catatan")
        ],
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child:Image.asset("images/mobil.jpg")),
        Expanded(
          flex: 1,
            child:Image.asset("images/rumah.jpg")
        ),
        Expanded(child:Image.asset("images/sofa.jpg")),
      ],
    );
  }
}

