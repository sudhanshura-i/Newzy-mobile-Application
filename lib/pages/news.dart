import 'package:cloud_firestore/cloud_firestore.dart';

class News {
  String id;
  String heading;
  String info;
  String image;

  Timestamp createdAt;

  News();

  News.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    heading = data['heading'];
    info = data['info'] ?? '';
    image = data['image'];
    createdAt = data['createdAt'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'heading': heading,
      'info': info,
      'image': image,
      'createdAt': createdAt,
    };
  }
}
