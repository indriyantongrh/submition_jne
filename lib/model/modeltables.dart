// To parse this JSON data, do
//
//     final modeltables = modeltablesFromJson(jsonString);

import 'dart:convert';

List<Modeltables> modeltablesFromJson(String str) => List<Modeltables>.from(json.decode(str).map((x) => Modeltables.fromJson(x)));

String modeltablesToJson(List<Modeltables> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Modeltables {
  Modeltables({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.website,
    this.username,
  });

  int id;
  String name;
  String email;
  String phone;
  String website;
  String username;

  factory Modeltables.fromJson(Map<String, dynamic> json) => Modeltables(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    website: json["website"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "website": website,
    "username": username,
  };
}
