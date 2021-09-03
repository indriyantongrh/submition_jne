// To parse this JSON data, do
//
//     final modeldetailreport = modeldetailreportFromJson(jsonString);

import 'dart:convert';

List<Modeldetailreport> modeldetailreportFromJson(String str) => List<Modeldetailreport>.from(json.decode(str).map((x) => Modeldetailreport.fromJson(x)));

String modeldetailreportToJson(List<Modeldetailreport> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Modeldetailreport {
  Modeldetailreport({
    this.idReport,
    this.projectName,
    this.datetime,
    this.hari,
    this.activity,
    this.progress,
    this.urgent,
  });

  String idReport;
  String projectName;
  String datetime;
  String hari;
  String activity;
  String progress;
  String urgent;

  factory Modeldetailreport.fromJson(Map<String, dynamic> json) => Modeldetailreport(
    idReport: json["idReport"],
    projectName: json["projectName"],
    datetime: json["datetime"],
    hari: json["hari"],
    activity: json["activity"],
    progress: json["progress"],
    urgent: json["urgent"],
  );

  Map<String, dynamic> toJson() => {
    "idReport": idReport,
    "projectName": projectName,
    "datetime": datetime,
    "hari": hari,
    "activity": activity,
    "progress": progress,
    "urgent": urgent,
  };
}
