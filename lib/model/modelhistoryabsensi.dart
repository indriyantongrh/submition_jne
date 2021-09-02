// To parse this JSON data, do
//
//     final modelhitoryabsensi = modelhitoryabsensiFromJson(jsonString);

import 'dart:convert';

List<Modelhitoryabsensi> modelhitoryabsensiFromJson(String str) => List<Modelhitoryabsensi>.from(json.decode(str).map((x) => Modelhitoryabsensi.fromJson(x)));

String modelhitoryabsensiToJson(List<Modelhitoryabsensi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Modelhitoryabsensi {
  Modelhitoryabsensi({
    this.id,
    this.hari,
    this.datetime,
    this.checkin,
    this.checkout,
    this.keterangan,
  });

  String id;
  String hari;
  String datetime;
  String checkin;
  String checkout;
  String keterangan;

  factory Modelhitoryabsensi.fromJson(Map<String, dynamic> json) => Modelhitoryabsensi(
    id: json["id"],
    hari: json["hari"],
    datetime: json["datetime"],
    checkin: json["checkin"],
    checkout: json["checkout"],
    keterangan: json["keterangan"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "hari": hari,
    "datetime": datetime,
    "checkin": checkin,
    "checkout": checkout,
    "keterangan": keterangan,
  };
}
