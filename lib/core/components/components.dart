// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.controller,
    required this.hintText1,
     this.IconButton,
    
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText1;
  Widget ?IconButton;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0),
      child: Container(
        width: 500,
        height: 30,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: hintText1,
          suffixIcon: IconButton,
          ),
        ),
      ),
    );
  }
}
