import "package:flutter/material.dart";
import 'page_1.dart';
import 'page_2.dart';

void main(){
  runApp(
      MaterialApp(
        title: "Homepage",
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/":(context) => const Page1(),
          "/page2":(context) => const Page2(),
        },
      )
  );
}

