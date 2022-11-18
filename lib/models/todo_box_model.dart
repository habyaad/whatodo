import 'package:hive_flutter/adapters.dart';
import '../utils/todo_adapter.dart';

class TodoBox{

  static String todoBoxName = 'todo-box';

  Future<Box> initializeBox() async{
    Box todoBox = await Hive.openBox<TodoModel>(todoBoxName);
    return todoBox;
  }
}