import 'package:hive/hive.dart';

class User {
  User._();
  static String userBox = 'user-box';

  static Future<Box> initializeBox() async {
    Box userBox = await Hive.openBox("user-name");
    return userBox;
  }

  static bool userExists(Box box) {
    String? username = box.get('username');
    if (username == null) {
      print("no user yet!");
      return false;
    } else {
      print("$username exists!");
      return true;
    }
  }
  static Future<void> registerUser(Box box, String name) async{
    box.put('username', name);
  }
}
