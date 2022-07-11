import 'dart:convert';

import 'package:image_collage/image_collage.dart';

class Announcement {
  Announcement({
    required this.id,
    required this.title,
    required this.description,
    this.image,
    required this.likes,
  });

  int id;
  String title;
  String description;
  List<Img>? image;
  int likes;

  factory Announcement.fromJson(String str) =>
      Announcement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Announcement.fromMap(Map<String, dynamic> json) => Announcement(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        likes: json["likes"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "likes": likes,
      };
}
