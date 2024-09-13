import "package:flutter/material.dart";

class Page1 extends StatelessWidget{
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 1",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context,"/page2"), icon: const Icon(Icons.search,color: Colors.white))
        ],
      ),
    );
  }
}