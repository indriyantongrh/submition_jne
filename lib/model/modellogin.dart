// To parse this JSON data, do
//
//     final modellogin = modelloginFromJson(jsonString);

import 'dart:convert';

Modellogin modelloginFromJson(String str) => Modellogin.fromJson(json.decode(str));

String modelloginToJson(Modellogin data) => json.encode(data.toJson());

class Modellogin {
  Modellogin({
    this.success,
    this.message,
    this.id,
    this.namaLengkap,
  });

  int success;
  String message;
  String id;
  String namaLengkap;

  factory Modellogin.fromJson(Map<String, dynamic> json) => Modellogin(
    success: json["success"],
    message: json["message"],
    id: json["id"],
    namaLengkap: json["nama_lengkap"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "id": id,
    "nama_lengkap": namaLengkap,
  };
}
