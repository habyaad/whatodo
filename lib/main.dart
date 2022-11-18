import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:whatodo/pages/todo_screen.dart';
import 'package:whatodo/pages/todoview.dart';
import 'package:whatodo/utils/todo_adapter.dart';
import 'models/todo_box_model.dart';
import 'models/user_model.dart';
import 'pages/homepage.dart';
import 'package:google_fonts/google_fonts.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  Box userBox = await User.initializeBox();
  runApp(MyApp(box: userBox));
}

class MyApp extends StatelessWidget {
  final Box box;
  const MyApp({Key? key, required this.box}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SplashPage(box: box,),
    );
  }
}

class SplashPage extends StatelessWidget {
  final Box box;
  const SplashPage({Key? key, required this.box}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      photoSize: 150.0,
      image: Image.asset(
        'assets/images/todos.png',
      ),
      title: Text(
        'TODO',
        style: GoogleFonts.montserrat(
            color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 24.0),
      ),
      loadingText: Text(
        'Organize your daily activities',
        style: GoogleFonts.poppins(color: Colors.redAccent, fontSize: 12.0),
      ),
      navigateAfterSeconds: TodoScreen(box: box,)
    );
  }
}

