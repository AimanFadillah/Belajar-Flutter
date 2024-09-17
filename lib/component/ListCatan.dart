import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/CatatanController.dart';
import 'package:untitled/model/Catatan.dart';

class ListCatan extends StatelessWidget {
  final Catatan catan;
  const ListCatan({required this.catan,super.key});

  @override
  Widget build(BuildContext context){
    final catatanController = Get.put(CatatanController());
    return Container(
      margin: const EdgeInsets.fromLTRB(10,18,10,0),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.black,
            width: 0.9
        ),
        borderRadius: BorderRadius.circular(5),
        color: Colors.yellow,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(catan.nama as String,style: TextStyle(fontSize: 17)),
          Row(
            children: [
              IconButton(
                  onPressed:(){
                    catatanController.deleteCatan(catan.id as int);
                  },
                  icon: Icon(Icons.delete,color: Colors.black)
              )
            ],
          )
        ],
      ),
    );
  }
}