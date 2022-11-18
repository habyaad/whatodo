import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:whatodo/pages/todoview.dart';

import '../models/user_model.dart';
import 'homepage.dart';

class TodoScreen extends StatelessWidget {
  final Box box;

  const TodoScreen({Key? key, required this.box}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('determine where to go');
    return User.userExists(box)
        ? TodoView(name: box.get('username'))
        : MyHomePage(
            title: 'Todo',
            box: box,
          );
  }
}
