// import 'dart:io';

// import 'package:adminbook/core/models/Add_Book.dart';
// import 'package:adminbook/feture/addbook/ser_addbook.dart';
// import 'package:dio/dio.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

//    final cover =  MultipartFile.fromFile; 
//     final file =  MultipartFile.fromFile; 
              

// class AddBook_Ui extends StatefulWidget {
//    AddBook_Ui({super.key});

//   @override
//   State<AddBook_Ui> createState() => _AddBook_UiState();
// }

// class _AddBook_UiState extends State<AddBook_Ui> {
 
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Column(
// mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: 30,
//             width: 100,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton(onPressed: () async {
//                  final image = await FilePicker.platform.pickFiles(); 
                 
//                  final file = await MultipartFile.fromFile(image!.files.first.path!, filename: "${image.files.first.name}.png"); 
              
//                       final map = { 
//               "title": "cooking book", 
//               "total_pages": "200", 
//               "description": "book", 
//               "points": "100", 
//               "author_name": "ola", 
//               "cover": cover, 
//               "file": file,
              
//                 }; 
//               print(map);
//                       final body = FormData.fromMap(map);

//                       Dio dio=Dio();
//                       Response res =await dio.post("http://localhost:8000/api/books",data:body);  
//                       print(res.data);     
//               }, child: Icon(Icons.add),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//             width: 100,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton(onPressed: () async {
//                 final pdf = await FilePicker.platform.pickFiles(); 
                 
//                  final cover = await MultipartFile.fromFile(pdf!.files.first.path!, filename: "${pdf.files.first.name}.pdf"); 
              
//                       final map = { 
//               "title": "mario", 
//               "total_pages": "samir", 
//               "description": "andrawos", 
//               "points": "100", 
//               "author_name": "aaaaa", 
//               "cover": cover, 
//               "file": file, 
               
//                       }; 
//                       final body = FormData.fromMap(map);
//                       Dio dio=Dio();
//                       Response res =await dio.post("http://localhost:8000/api/books",data:body);
              
//                 print(res);
//               }, child: Icon(Icons.picture_as_pdf_rounded)),
//             ),
//           )
//         ],
//       ),
     
    
       
//     );
//   }
// // dynamic ? image;

// //   @override
// //   Widget build(BuildContext context) {
// //     return  Scaffold(

// // body: Column(children: [
// //   Container(
// //     height: 400,
// //     width: 300,
// //     child: image==null?Icon(Icons.add_a_photo):Image.file(image!),
// //   ),
// //   ElevatedButton(onPressed: (){
// // dynamic temp=addbook(AddBookModel(title: "title", file: "", cover: "cover", author_name: "author_name", points: "points", description: "description", total_pages: "total_pages", type_id: "type_id"));
// // if (temp) {
// //   print("book has added");
// // } else {
// //    print("error in adding book");
// // }
// //   }, child: Icon(Icons.add)),

// // ],),
// //     );
// //   }

// //   getImageGallery() async {
// //     var imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
// //     setState(() {
// //       image = imageFile;
// //     });
// //   }
// }
