// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddBookModel {
String title;
String file;
String cover;
String author_name; 
String points;
String description;
String total_pages; 
String type_id; 
  AddBookModel({
    required this.title,
    required this.file,
    required this.cover,
    required this.author_name,
    required this.points,
    required this.description,
    required this.total_pages,
    required this.type_id,
  });

  AddBookModel copyWith({
    String? title,
    String? file,
    String? cover,
    String? author_name,
    String? points,
    String? description,
    String? total_pages,
    String? type_id,
  }) {
    return AddBookModel(
      title: title ?? this.title,
      file: file ?? this.file,
      cover: cover ?? this.cover,
      author_name: author_name ?? this.author_name,
      points: points ?? this.points,
      description: description ?? this.description,
      total_pages: total_pages ?? this.total_pages,
      type_id: type_id ?? this.type_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'file': file,
      'cover': cover,
      'author_name': author_name,
      'points': points,
      'description': description,
      'total_pages': total_pages,
      'type_id': type_id,
    };
  }

  factory AddBookModel.fromMap(Map<String, dynamic> map) {
    return AddBookModel(
      title: map['title'] as String,
      file: map['file'] as String,
      cover: map['cover'] as String,
      author_name: map['author_name'] as String,
      points: map['points'] as String,
      description: map['description'] as String,
      total_pages: map['total_pages'] as String,
      type_id: map['type_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddBookModel.fromJson(String source) => AddBookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddBook(title: $title, file: $file, cover: $cover, author_name: $author_name, points: $points, description: $description, total_pages: $total_pages, type_id: $type_id)';
  }

  @override
  bool operator ==(covariant AddBookModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.file == file &&
      other.cover == cover &&
      other.author_name == author_name &&
      other.points == points &&
      other.description == description &&
      other.total_pages == total_pages &&
      other.type_id == type_id;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      file.hashCode ^
      cover.hashCode ^
      author_name.hashCode ^
      points.hashCode ^
      description.hashCode ^
      total_pages.hashCode ^
      type_id.hashCode;
  }
}
