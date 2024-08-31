import 'package:hive/hive.dart';

class TodoDatabase {

  List TodoList = [];

  //reference hive box
  final _myBox = Hive.box('mybox');

  void createInitialData() {
    TodoList = [
      ["Todo App", false],
      ["Calculator App", false]
    ];

  }

  void loadData() {
    TodoList = _myBox.get("TodoList");
  }

  void updateData() {
    _myBox.put("TddoList", TodoList);
  }
}