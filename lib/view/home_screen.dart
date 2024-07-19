import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contarolar/todoContarolar.dart';
TextEditingController txtTask=TextEditingController();
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Todocontarolar todocontarolar=Get.put(Todocontarolar());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff0AB6AB),
        title: Text("TODO List"),
      ),
      body:
       Obx(()=>
          ListView.builder(
            itemCount: todocontarolar.ToDoList.length,
            itemBuilder: (context, index) {

           return GestureDetector(
             onLongPress: () {
              showDialog(context: context, builder: (context) => AlertDialog(
                title: Text("Delet Task"),
                actions: [
                  TextButton(onPressed: () {
                    todocontarolar.delettask(index);
                    Get.back();
                    

                  }, child: Text("Delet")),


                ],

              ),);


             },
             child: Container(
               height: 50,

               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(15),
                 color: Color(0xff201F1F)
               ),
               margin: EdgeInsets.all(10),
               child: Row(
                 children: [
                   SizedBox(width: 20,),
                   Text(todocontarolar.ToDoList[index]['number'].toString(),style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold

                   ),),
                   SizedBox(width: 20,),
                   Text(todocontarolar.ToDoList[index]['title'],style: TextStyle(
                     color: Colors.white,
                       fontWeight: FontWeight.bold,
                     fontSize: 19
                   ),),


                 ],
               ),
             ),
           );
          },
               ),
       ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,size: 25,color: Colors.black,),
        backgroundColor: Color(0xff0AB6AB),
        onPressed: () {
          showDialog(context: context, builder: (context) => AlertDialog(
            title: Text("Add to Task"),
            content: TextField(
              controller: txtTask,

            ),
            actions: [
              TextButton(onPressed: () {
               task=txtTask.text;
               txtTask.clear();
               Get.back();
               int index=todocontarolar.index.value;
               todocontarolar.changindex();
               todocontarolar.addtask(
                   {
                     'title':task,
                     'number':index,
                   }

               );


              }, child: Text("Save")),
              TextButton(onPressed: () {
                Get.back();


              }, child: Text("back")),

            ],
          ),);

        },
      ),
    );
  }
}
String task='';
