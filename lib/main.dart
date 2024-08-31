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
    return Column(
      children: [
        const Wadah(
            child:Text("Strawberry Pavloa",textAlign: TextAlign.center,style: const TextStyle(fontWeight: FontWeight.bold) )
        ),
        const Wadah(
            child:Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a",textAlign: TextAlign.center,style: const TextStyle(fontWeight: FontWeight.bold) )
        ),
        Wadah(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children:List.generate(5,(index) =>  const Icon(Icons.star))
              ),
              const Text("170 Reviews")
            ],
          ),
        ),
        const Wadah(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconWithDeskripsi(ikon: Icon(Icons.book), namaIkon: "PREP", time: "25 min"),
              IconWithDeskripsi(ikon: Icon(Icons.timer), namaIkon: "COOK", time: "1 hr"),
              IconWithDeskripsi(ikon: Icon(Icons.add_chart), namaIkon: "FEEDS", time: "4-6"),
            ],
          ),
        )
      ],
    );
  }
}

class IconWithDeskripsi extends StatelessWidget {
  const IconWithDeskripsi ({required this.ikon,super.key, required this.namaIkon, required this.time});
  final Icon ikon;
  final String namaIkon;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ikon,
        Text(namaIkon),
        SizedBox(height: 10),
        Text(time,style:const TextStyle(fontSize: 12))
      ],
    );
  }
}

class Wadah extends StatelessWidget{
  const Wadah ({required this.child,super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
      return Container(
        margin: const EdgeInsets.fromLTRB(10,10,10,0),
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width,
        decoration:BoxDecoration(
            color: Colors.lightBlueAccent,
            border:Border.all(
                color: Colors.black,
                width: 1
            ),
            borderRadius: BorderRadius.circular(5)
        ),
        // child: Text(text,textAlign: TextAlign.center,style: const TextStyle(fontWeight: FontWeight.bold) ),
        child: child,
      );
  }
}
