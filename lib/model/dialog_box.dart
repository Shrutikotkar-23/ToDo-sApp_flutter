import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp/model/button.dart';

class Dialog_box extends StatelessWidget {
  final controller;

  final VoidCallback onSave;
  final VoidCallback onCancel;


  
  Dialog_box({
    super.key , 
    required this.controller,
    required this.onSave,
    required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
          padding: const EdgeInsets.only(top: 8),
          height: 250,
          width: 280,
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            TextField(
              controller: controller,
                decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add new Task",
            )),

            

            const TextField(
              
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Description",
            )),

            // const SizedBox(height: 5,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

              MyButton(
                text: "Save",
                onPressed: onSave, 
               
              ),
              
              const SizedBox(width :20),

              MyButton(
                text :"Cancel",
                onPressed: onCancel, 
            
              ),

            ],)
          ]),
        ));
  }
}
