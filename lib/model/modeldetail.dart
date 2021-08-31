// To parse this JSON data, do
//
//     final modeldetail = modeldetailFromJson(jsonString);

import 'dart:convert';

List<Modeldetail> modeldetailFromJson(String str) => List<Modeldetail>.from(json.decode(str).map((x) => Modeldetail.fromJson(x)));

String modeldetailToJson(List<Modeldetail> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Modeldetail modeldetailFromJson(String str) => Modeldetail.fromJson(json.decode(str));
//
// String modeldetailToJson(Modeldetail data) => json.encode(data.toJson());

class Modeldetail {
  Modeldetail({
    this.datauser,
  });

  List<Datauser> datauser;

  factory Modeldetail.fromJson(Map<String, dynamic> json) => Modeldetail(
    datauser: List<Datauser>.from(json["datauser"].map((x) => Datauser.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "datauser": List<dynamic>.from(datauser.map((x) => x.toJson())),
  };
}

class Datauser {
  Datauser({
    this.id,
    this.namalengkap,
    this.email,
    this.nomortelepon,
    this.nik,
    this.level,
    this.password,
  });

  String id;
  String namalengkap;
  String email;
  String nomortelepon;
  String nik;
  String level;
  String password;

  factory Datauser.fromJson(Map<String, dynamic> json) => Datauser(
    id: json["id"],
    namalengkap: json["namalengkap"],
    email: json["email"],
    nomortelepon: json["nomortelepon"],
    nik: json["nik"],
    level: json["level"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "namalengkap": namalengkap,
    "email": email,
    "nomortelepon": nomortelepon,
    "nik": nik,
    "level": level,
    "password": password,
  };
}
