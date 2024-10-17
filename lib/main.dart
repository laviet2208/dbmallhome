import 'package:dbmallhome/before_screen/login_screen/loading_screen.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: FirebaseOptions(
    //   apiKey: "AIzaSyB6IQCpkuF7AOwE3JyI0FPIuqMNIOJHn0s",
    //   authDomain: "dbmall-onelink-01.firebaseapp.com",
    //   databaseURL: "https://dbmall-onelink-01-default-rtdb.firebaseio.com",
    //   projectId: "dbmall-onelink-01",
    //   storageBucket: "dbmall-onelink-01.appspot.com",
    //   messagingSenderId: "201552769484",
    //   appId: "1:201552769484:web:7456b932cc33a4b76dad69",
    //   measurementId: "G-X4YMMRFRLT",
    // ),
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? language = prefs.getString('language');
  if (language != null) {
    if (language == 'ENG') {
      finaldata.mainlanguage = finaldata.en;
    } else {
      finaldata.mainlanguage = finaldata.vi;
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dubai Mall',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const loading_screen(),
    );
  }
}
