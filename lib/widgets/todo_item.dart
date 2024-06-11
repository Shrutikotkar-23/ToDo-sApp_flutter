import 'package:flutter/material.dart';
import 'package:todoapp/model/todo.dart';
// import 'package:todoapp/screens/home.dart';
// import 'package:todoapp/model/dialog_box.dart';


class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onTodochange;
  final onDelete;
 
  

  ToDoItem({
    Key? key , 
    required this.todo,
    required this.onTodochange,
    required this.onDelete,
   
    }) : super(key: key);
  
    

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
        child: ListTile(
      onTap: () {
        onTodochange(todo);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 5 ),
      tileColor:const Color.fromARGB(255, 78, 126, 166),
      leading: Icon( 
             todo.isDone ? Icons.check_box  : Icons.check_box_outline_blank,
            color: const Color.fromARGB(255, 0, 4, 6)
          ),
      title: Text(
        todo.todoText!,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            decoration: todo.isDone ? TextDecoration.lineThrough :null,
          )),
      trailing: PopupMenuButton(
        itemBuilder:(context) => [

          PopupMenuItem(
              child: TextButton.icon(
                
                  onPressed: null,
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete')),
                  onTap: () {
                    onDelete(todo.id);
                  },
                  ),

          PopupMenuItem(
              
              child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.description),
                  label: const Text('Decription')),
                  onTap: () {},
                  ),

           

                  PopupMenuItem(
                    onTap: createElement,
                   child: TextButton.icon(
                
                  onPressed: null,
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit')),
                     
                  
                  ),
        ],
      ),
    ));
  }
}