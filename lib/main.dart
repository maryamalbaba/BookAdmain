import 'package:adminbook/feture/addbook/AddBook_ui.dart';
import 'package:adminbook/feture/addbook/view_addbook.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddBook_ui(),
     );
  }
}
