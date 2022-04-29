import 'package:dio_and_json/screen/list_user_screen.dart';
import 'package:dio_and_json/screen/single_user_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dio',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const ListUser(),
    );
  }
}

