import "package:flutter/material.dart";

class Counter extends StatefulWidget {
  const Counter ({super.key});
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _angka = 1;

  void bertambah (){
    setState(() {
      _angka++;
    });
  }

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: bertambah, child: const Text("Tambah")),
        const SizedBox(width: 16),
        Text("$_angka"),
      ],
    );
  }
}

void main () {
  runApp(
    const MaterialApp(
      home:Scaffold(
        body: Center(
          child: Counter(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    )
  );
}