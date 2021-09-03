// To parse this JSON data, do
//
//     final modelusers = modelusersFromJson(jsonString);

import 'dart:convert';

List<Modelusers> modelusersFromJson(String str) => List<Modelusers>.from(json.decode(str).map((x) => Modelusers.fromJson(x)));

String modelusersToJson(List<Modelusers> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Modelusers {
  Modelusers({
    this.id,
    this.namalengkap,
    this.email,
    this.nomortelepon,
    this.level,
    this.jabatan,
    this.nik,
  });

  String id;
  String namalengkap;
  String email;
  String nomortelepon;
  String level;
  String jabatan;
  String nik;

  factory Modelusers.fromJson(Map<String, dynamic> json) => Modelusers(
    id: json["id"],
    namalengkap: json["namalengkap"],
    email: json["email"],
    nomortelepon: json["nomortelepon"],
    level: json["level"],
    jabatan: json["jabatan"],
    nik: json["nik"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "namalengkap": namalengkap,
    "email": email,
    "nomortelepon": nomortelepon,
    "level": level,
    "jabatan": jabatan,
    "nik": nik,
  };
}
