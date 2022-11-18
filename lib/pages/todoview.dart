import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'createTodo.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    print('logged in');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateTodo()
              ));
        },

      ),
      body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0))
              ),
              child: Center(
                child: Text('Welcome $name! ',
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}

class _Todo extends StatelessWidget {
  const _Todo({Key? key, required this.task, this.description})
      : super(key: key);
  final String task;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(4.0),
      child: (
          Card(
          )
      ),
    );
  }
}

class HasTodo extends StatelessWidget {
  const HasTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
