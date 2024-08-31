import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/dailog_box.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/todo_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TodoDatabase db = TodoDatabase();

  @override
  void initState() {

    if (_myBox.get("TodoList") == null){
      db.createInitialData();
    }else{
      db.loadData();
    }

    super.initState();
  }

  //open the hive box
  final _myBox = Hive.box('mybox');

  final _controller = TextEditingController();


  // checkbox tapped
  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.TodoList[index][1] = !db.TodoList[index][1];
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.TodoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  //create new task
  void createNewTask () {
    showDialog(context: context, builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop());
    }
    );
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.TodoList.removeAt(index);
    });
    db.updateData();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Todo App",
          style: TextStyle(color: Colors.yellow,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: createNewTask,
          backgroundColor: Colors.yellow,
      child: const Icon(Icons.add)
      ),
      body: ListView.builder(
        itemCount: db.TodoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.TodoList[index] [0],
            taskCompleted: db.TodoList[index] [1],
            onChanged: (value) => checkboxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        }
      ),
    );
  }
}
