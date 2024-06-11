import 'package:flutter/material.dart';
import 'package:todoapp/model/dialog_box.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/widgets/todo_item.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _controller = TextEditingController();
  final todoList = ToDo.todoList();

  List<ToDo> _foundTodo = [];

  @override
  void initState() {
    _foundTodo = todoList;
    super.initState();
  }

  void saveNewtask() {
    setState(() {
      todoList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: _controller.text,
      ));
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTast() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog_box(
          controller: _controller,
          onSave: saveNewtask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 182, 209, 231),
        appBar: buildAppbar(),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: Column(
                children: [
                  searchbox(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 40,
                            bottom: 20,
                          ),
                          child: const Text(
                            'All ToDos',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        for (ToDo todoo in _foundTodo.reversed)
                          ToDoItem(
                            
                            todo: todoo,
                            onTodochange: _handleTodochange,
                            onDelete: _deleteTodo,
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: ElevatedButton(
                    onPressed: createNewTast,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: const Color.fromARGB(255, 28, 55, 102),
                      minimumSize: const Size(70, 70),
                      elevation: 15,
                    ),
                    child: const Text('+',
                        style: TextStyle(
                          fontSize: 45,
                        )),
                  )),
            )
          ],
        ));
  }

  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 28, 55, 102),
      title: const Row(
        children: [
          Icon(Icons.menu, color: Colors.white, size: 30),
        ],
      ),
    );
  }

  void _handleTodochange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodo(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addTodoItem(String todo) {
    setState(() {
      todoList.add(
        ToDo(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            todoText: todo),
      );
    });
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundTodo = results;
    });
  }

  Widget searchbox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search, color: Colors.black, size: 20),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            ),
            border: InputBorder.none,
            hintText: 'Search Task',
            hintStyle: TextStyle(color: Color.fromARGB(255, 57, 56, 56))),
      ),
    );
  }
}
