// To parse this JSON data, do
//
//     final modelhitoryreport = modelhitoryreportFromJson(jsonString);

import 'dart:convert';

List<Modelhitoryreport> modelhitoryreportFromJson(String str) => List<Modelhitoryreport>.from(json.decode(str).map((x) => Modelhitoryreport.fromJson(x)));

String modelhitoryreportToJson(List<Modelhitoryreport> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Modelhitoryreport {
  Modelhitoryreport({
    this.idReport,
    this.id,
    this.projectName,
    this.datetime,
    this.hari,
    this.activity,
    this.progress,
    this.urgent,
  });

  String idReport;
  String id;
  String projectName;
  String datetime;
  String hari;
  String activity;
  String progress;
  String urgent;

  factory Modelhitoryreport.fromJson(Map<String, dynamic> json) => Modelhitoryreport(
    idReport: json["idReport"],
    id: json["id"],
    projectName: json["projectName"],
    datetime: json["datetime"],
    hari: json["hari"],
    activity: json["activity"],
    progress: json["progress"],
    urgent: json["urgent"],
  );

  Map<String, dynamic> toJson() => {
    "idReport": idReport,
    "id": id,
    "projectName": projectName,
    "datetime": datetime,
    "hari": hari,
    "activity": activity,
    "progress": progress,
    "urgent": urgent,
  };
}
