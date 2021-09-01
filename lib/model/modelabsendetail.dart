// To parse this JSON data, do
//
//     final modelabsendetail = modelabsendetailFromJson(jsonString);

import 'dart:convert';

List<Modelabsendetail> modelabsendetailFromJson(String str) => List<Modelabsendetail>.from(json.decode(str).map((x) => Modelabsendetail.fromJson(x)));

String modelabsendetailToJson(List<Modelabsendetail> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Modelabsendetail {
  Modelabsendetail({
    this.id,
    this.idAbsensi,
    this.checkin,
    this.keterangan,
  });

  String id;
  String idAbsensi;
  String checkin;
  String keterangan;

  factory Modelabsendetail.fromJson(Map<String, dynamic> json) => Modelabsendetail(
    id: json["id"],
    idAbsensi: json["id_absensi"],
    checkin: json["checkin"],
    keterangan: json["keterangan"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_absensi": idAbsensi,
    "checkin": checkin,
    "keterangan": keterangan,
  };
}