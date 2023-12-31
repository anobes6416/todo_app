import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:todo_app/Service/Auth_Service.dart';
import 'package:todo_app/pages/HomePage.dart';
import 'package:todo_app/pages/SignInPage.dart';
import 'pages/SignUpPage.dart';
import 'package:todo_app/pages/AddToDo.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget currentPage = SignUpPage();
  AuthClass authClass = AuthClass();

  @override
void initState() {
    // TODO: implement initState
    super.initState();
  }

  void checkLogin() async{
    String? token = await authClass.getToken();
    if(token != null){
      setState(() {
        currentPage = HomePage();
      });
    }
  }

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}