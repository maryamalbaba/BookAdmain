import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:adminbook/core/colors/color.dart';
import 'package:adminbook/core/components/assets_manager.dart';
import 'package:adminbook/core/components/components.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AddBook_ui extends StatefulWidget {
  AddBook_ui({super.key});

  @override
  State<AddBook_ui> createState() => _AddBook_uiState();
}

class _AddBook_uiState extends State<AddBook_ui> {
  TextEditingController Title_controller = TextEditingController();

  TextEditingController auther_name_Controller = TextEditingController();

  TextEditingController Type_Controller = TextEditingController();

  TextEditingController Totalpage_Controller = TextEditingController();

  TextEditingController Points_Controller = TextEditingController();

  TextEditingController Files_Controller = TextEditingController();

  TextEditingController description_Controller = TextEditingController();

  File image = File("assets/images/addButton.png");

  File pdf = File("assets/images/cachmemory.pdf");

  final picker = ImagePicker();

  Future getimage() async {
    final pickedfile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedfile != null) {
      setState(() {
        image = File(pickedfile.path);
      });
    } else {
      print("no image");
    }
  }

  Future getpdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        File pdf = File(result.files.single.path!);
      });
    } else {
      // User canceled the picker
      print("no pdf");
    }
  }

  Future createbook(
      File cover,
      File file,
      String title,
      String author_name,
      String points,
      String description,
      String total_pages,
      String type_id) async {
    var request = await http.MultipartRequest(
        'POST', Uri.parse('http://localhost:8000/api/books'));
    request.fields.addAll({
      'title': title,
      'author_name': author_name,
      'points': points,
      'description': description,
      'total_pages': total_pages,
      'type_id': type_id
    });
    request.files.add(await http.MultipartFile.fromPath('file', pdf.path));
    request.files.add(await http.MultipartFile.fromPath('cover', image.path));
   //  request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(" status response is 200");
      print(await response.stream.bytesToString());
    } else {
      print("status respnse is bad");
      print(response.reasonPhrase);
    }
  }

  solveProblem() async {
    final image = await FilePicker.platform.pickFiles();
    final file = await MultipartFile.fromFile(image!.files.first.path!,
        filename: "${image.files.first.name}.png");

    final image2 = await FilePicker.platform.pickFiles();
    final file2 = await MultipartFile.fromFile(image!.files.first.path!,
        filename: "${image.files.first.name}.pdf");
   

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: biege,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 277,
            color: green,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " Add book",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      getimage();
                    },
                    child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(camera)))
                        // image!=null? DecorationImage(image: (FileImage (getimage as File)): AssetImage(camera))),
                        ),
                  ),
                ],
              ),
            ),
          ),
          MyTextField(
            hintText1: 'Title',
            controller: Title_controller,
          ),
          MyTextField(
            hintText1: 'Auther name',
            controller: auther_name_Controller,
          ),
          MyTextField(
            hintText1: 'Type',
            controller: Type_Controller,
          ),
          MyTextField(
            hintText1: 'Total page',
            controller: Totalpage_Controller,
          ),
          MyTextField(
            hintText1: 'Points',
            controller: Points_Controller,
          ),
          MyTextField(
            hintText1: 'description',
            controller: description_Controller,
          ),
          MyTextField(
            hintText1: 'Files',
            controller: Files_Controller,
            IconButton: IconButton(
              onPressed: () {
                getpdf();
              },
              icon: Icon(Icons.folder),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  createbook(
                      pdf!,
                      image!,
                      Title_controller.text,
                      auther_name_Controller.text,
                      Points_Controller.text,
                      description_Controller.text,
                      Totalpage_Controller.text,
                      "");
                //  await solveProblem();
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(addButton))),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
