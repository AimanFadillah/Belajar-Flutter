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
    // return GridView.extent(
    //     maxCrossAxisExtent: 200,
    //     padding: const EdgeInsets.all(4),
    //     mainAxisSpacing: 4,
    //     crossAxisSpacing: 2,
    //     children: List.generate(6,(index) => Expanded(child: Image.asset("images/img${index + 1}.jpg"))),
    // );
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(6,(index) => Expanded(child: Image.asset("images/img${index + 1}.jpg"))),
    );
  }
}
