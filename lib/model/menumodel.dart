// To parse this JSON data, do
//
//     final menumodel = menumodelFromJson(jsonString);

import 'dart:convert';

List<Menumodel> menumodelFromJson(String str) => List<Menumodel>.from(json.decode(str).map((x) => Menumodel.fromJson(x)));

String menumodelToJson(List<Menumodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Menumodel {
  Menumodel({
    this.id,
    this.name,
    this.image,
    this.favorit,
  });

  int id;
  String name;
  String image;
  bool favorit;

  factory Menumodel.fromJson(Map<String, dynamic> json) => Menumodel(
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
