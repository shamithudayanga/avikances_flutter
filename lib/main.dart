

import 'package:avikances/login.dart';
import 'package:avikances/note.dart';
import 'package:avikances/start_jobs.dart';
import 'package:flutter/material.dart';


main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),

      home: FormScreen(),
      // home: Notes(),
      // home: Start_jobs(),



    );
  }
}
