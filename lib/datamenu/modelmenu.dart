// To parse this JSON data, do
//
//     final modelmenu = modelmenuFromJson(jsonString);

import 'dart:convert';

List<Modelmenu> modelmenuFromJson(String str) => List<Modelmenu>.from(json.decode(str).map((x) => Modelmenu.fromJson(x)));

String modelmenuToJson(List<Modelmenu> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Modelmenu {
  Modelmenu({
    this.id,
    this.name,
    this.image,
    this.favorit,
  });

  int id;
  String name;
  String image;
  String favorit;

  factory Modelmenu.fromJson(Map<String, dynamic> json) => Modelmenu(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    favorit: json["favorit"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "favorit": favorit,
  };
}
