import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:whatodo/models/user_model.dart';
import 'todoview.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title, required this.box, }) : super(key: key);
  final String title;
  final Box box;
  @override
  Widget build(BuildContext context) {
    TextEditingController? name = TextEditingController();
    print('log in');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 150, color: Colors.redAccent,),
            Form(
              child: TextFormField(
                controller: name,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    hintText: 'Enter your name to continue',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    )
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            ElevatedButton(
                onPressed: (){
                  User.registerUser(box, name.text);
                  Navigator.pop(context);
                },
                child: Text('Submit',
                style: GoogleFonts.montserrat(
                    fontSize: 14.0
                ),
                ))
          ],
        ),
      ),
    );
  }
}

