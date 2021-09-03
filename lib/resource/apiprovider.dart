import 'dart:convert';


import 'package:bms_mobile/model/model.dart';
import 'package:bms_mobile/model/modelabsendetail.dart';
import 'package:bms_mobile/model/modeldetail.dart';
import 'package:bms_mobile/model/modeldetailreport.dart';
import 'package:bms_mobile/model/modelhistoryabsensi.dart';
import 'package:bms_mobile/model/modelhistoryreport.dart';
import 'package:bms_mobile/model/modellogin.dart';
import 'package:bms_mobile/model/modeltables.dart';
import 'package:bms_mobile/model/modeluser.dart';
import 'package:bms_mobile/model/modelusers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  Client client = Client();
  String jsonSample;
  static String name;
  static String id;
  static String idReport;
  static String namalengkap;
  static String username;
  static String email;
  static String projectName;
  static String activity;
  static String progress;
  static String urgent;
  // static String datetime;
  static String jabatan;
  static String npp;
  static String nik;
  static String nomortelepon;
  static String level;
  static String datetime;
  static String hari;
  static String checkin;
  static String checkin_2;
  static String checkout;
  static String checkout_2;
  static String keterangan;
  static String password;
  static String id_absen;
  // static String idUsers="";

  static int success;
  static String message;
  static Map data;
  static String BASEURL = "http://api-backup-pb.acarain.com/api-jne/";
  final _BaseUrl = "https://jsonplaceholder.typicode.com/users";

  static GlobalKey<ScaffoldState> scaffold_state = new GlobalKey<ScaffoldState>();



  // API for get datatable
  Future<List<Modeltables>> fetchDataTables() async {
    print("masuk");
    print(_BaseUrl);
    final response = await client.get(_BaseUrl);
    if (response.statusCode == 200) {
      print(response.body);
      jsonSample = (response.body);

      return compute(modeltablesFromJson, response.body);
    } else {
      print("Load gagal");
     // print(_BaseUrl);
    }
  }

  // api get user
  Future<List<Modeluser>> fetchDataUser() async {
    print("masuk");
    final responseUser =
        await client.get("https://api.mocki.io/v1/6f6fec94");
    if (responseUser.statusCode == 200) {
      print(responseUser.body);
      final data = json.decode(responseUser.body);
      print("Print string : ${data}");

      name = data[0]["name"];
      username = data[0]["username"];
      email = data[0]["email"];


      return compute(modeluserFromJson, responseUser.body);
    } else {
      print("Load gagal");
    }
  }

  // api get user
  Future<List<Modeldetail>> fetchuserDetail() async {
    print("masuk");
    final responseUser =
    await client.get(BASEURL+"detailuser.php?id="+id);
    if (responseUser.statusCode == 200) {
      print(responseUser.body);
      final data = json.decode(responseUser.body);
      print("Print string : ${data}");

      id = data[0]["id"];
      namalengkap = data[0]["namalengkap"];
      email = data[0]["email"];
      nik = data[0]["nik"];
      nomortelepon = data[0]["nomortelepon"];
      level = data[0]["level"];
      password = data[0]["password"];

      print(id);


      return compute(modeldetailFromJson, responseUser.body);
    } else {
      print("Load gagal");
    }
  }

  Future <Modellogin> fetchDataLogin() async {
    print("masuk");
    final responseLogin =
    await client.post("https://api-backup-pb.acarain.com/fieldtripkandri/logintest.php", body:{
      "email" : npp,
      "password" : password,
    }
    );
    if (responseLogin.statusCode == 200) {
      print(responseLogin.body);
      final data = json.decode(responseLogin.body);
      print("Print string : ${data}");

      return compute(modelloginFromJson, responseLogin.body);
    } else {
      print("Load gagal");
    }
  }
  //API login example
  static fetchLogin() async{
    http.post(BASEURL+"login.php", body:{
      "nik" : nik ,
      "password" : password,
    }).then((response) async {
    print("Response Login body: ${response.body}");
    data = await json.decode(response.body);

        success = data["success"];
        message = data["message"];
        id = data["id"];
        namalengkap = data["namalengkap"];
        level = data["level"];
        email = data["email"];
        nik = data["nik"];
        nomortelepon = data["nomortelepon"];
        print(success);

        // if (success == 1) {
        //   final SharedPreferences pref = await SharedPreferences.getInstance();
        //   await pref.setString( 'idUsers' , data["id"]);
        // }

    }

    );

  }




  static fetchregister() async{
    http.post(BASEURL+"registeruser.php", body:{
      "namalengkap" : namalengkap,
      "email" : email,
      "nomortelepon" : nomortelepon,
      "password" : password,
      "level" : level,
      "nik" : nik,
    }).then((response) async {
      print("Response Login body: ${response.body}");
      data = await json.decode(response.body);
      success = data["success"];
      message = data["message"];
      print(success);
    });
  }

  static fetchUpdateUser(String idUsers) async{
    http.post(BASEURL+"updateuser.php", body:{
      "id" : idUsers,
      "namalengkap" : namalengkap,
      "email" : email,
      "nomortelepon" : nomortelepon,
      "nik" : nik,
    }).then((response) async {
      print("Response Login body: ${response.body}");
      data = await json.decode(response.body);
      success = data["success"];
      message = data["message"];
      print(success);

      // await scaffold_state.currentState.showSnackBar(SnackBar(
      //     content: Text(
      //       ApiProvider.message,
      //       textAlign: TextAlign.center,
      //       style: TextStyle(fontFamily: 'AirBnB'),
      //     ),
      //     duration: Duration(seconds: 2),
      //
      // ));
    });
  }

  static fetchAbsensi(String idUsers) async{
    SharedPreferences preff = await SharedPreferences.getInstance();
    idUsers = preff.getString("idUsers");
    http.post(BASEURL+"insertabsen.php", body:{
      "id" : idUsers,
      "datetime" : datetime,
      "hari" : hari,
      "checkin" : checkin,
      "keterangan" : keterangan,
      "status" : "1",
    }).then((response) async {
      print("Response Login body: ${response.body}");
      data = await json.decode(response.body);
      success = data["success"];
      message = data["message"];
      print(success);



    });
  }

  // api get user
  Future<List<Modelabsendetail>> fetchabsenDetail() async {
    print("masuk");
    final responseUser =
    await client.get(BASEURL+"getabsensi.php?id="+id+"&datetime="+datetime);
    if (responseUser.statusCode == 200) {
      print(responseUser.body);
      final data = json.decode(responseUser.body);
      print("Print string : ${data}");

      id = data[0]["id"];
      id_absen = data[0]["id_absen"];
      checkin_2 = data[0]["checkin"];
      checkout_2 = data[0]["checkout"];
      keterangan = data[0]["keterangan"];


      print(id);


      return compute(modelabsendetailFromJson, responseUser.body);
    } else {
      print("Load gagal");
    }
  }

  static fetchUpdateAbsen(String idUsers) async{
    SharedPreferences preff = await SharedPreferences.getInstance();
    idUsers = preff.getString("idUsers");
    http.post(BASEURL+"updateabsensi.php", body:{
      "id" : idUsers,
      "datetime" : datetime,
      "checkout" : checkout,
      "status" : "2",

    }).then((response) async {
      print("Response update body: ${response.body}");
      data = await json.decode(response.body);
      success = data["success"];
      message = data["message"];
      print(success);

      // await scaffold_state.currentState.showSnackBar(SnackBar(
      //     content: Text(
      //       ApiProvider.message,
      //       textAlign: TextAlign.center,
      //       style: TextStyle(fontFamily: 'AirBnB'),
      //     ),
      //     duration: Duration(seconds: 2),
      //
      // ));
    });
  }

  static fetchDailyReport(String idUsers) async{
    SharedPreferences preff = await SharedPreferences.getInstance();
    idUsers = preff.getString("idUsers");
    http.post(BASEURL+"insertdailyreport.php", body:{
      "id" : idUsers,
      "projectName" : projectName,
      "activity" : activity,
      "progress" : progress,
      "urgent" : urgent,
      "datetime" : datetime,
      "hari" : hari,
    }).then((response) async {
      print("Response Login body: ${response.body}");
      data = await json.decode(response.body);
      success = data["success"];
      message = data["message"];
      print(success);
      print("Id anda: "+id);

    });
  }



  // API for get datatable
  Future<List<Modelhitoryabsensi>> fetchHistoryAbsen(String idUsers) async {
    SharedPreferences preff = await SharedPreferences.getInstance();
    idUsers = preff.getString("idUsers");
    print("masuk hisrtoy");
    print(BASEURL+"gethistoryabsensi.php?id="+idUsers);
    final response = await http.post(BASEURL+"gethistoryabsensi.php?id="+idUsers);
    if (response.statusCode == 200) {
      print(response.body);
      print("id history absen Apiprovider:"+idUsers);
      jsonSample = (response.body);

      return compute(modelhitoryabsensiFromJson, response.body);
    } else {
      print("Load gagal");
      //print(BASEURL+"gethistoryabsensi.php?id="+id);
    }
  }


  // API for get datatable
  Future<List<Modelhitoryreport>> fetchHistoryReport(String idUsers) async {
    SharedPreferences preff = await SharedPreferences.getInstance();
    idUsers = preff.getString("idUsers");


    print("masuk hisrtoy");
    print(BASEURL+"gethistorydaily.php?id="+idUsers);
    final response = await client.get(BASEURL+"gethistorydaily.php?id="+idUsers);
    if (response.statusCode == 200) {
      print(response.body);
      jsonSample = (response.body);

      return compute(modelhitoryreportFromJson, response.body);
    } else {
      print("Load gagal");
      //print(BASEURL+"gethistoryabsensi.php?id="+id);
    }
  }

  // api get user
  Future<List<Modeldetailreport>> fetchDetailReport() async {

    print("masuk");
    final responseUser =
    await client.get(BASEURL+"getdetailreport.php?idReport="+idReport);
    if (responseUser.statusCode == 200) {
      print(responseUser.body);
      final data = json.decode(responseUser.body);
      print("Print string : ${data}");

      id = data[0]["id"];
      idReport = data[0]["idReport"];
      projectName = data[0]["projectName"];
      activity = data[0]["activity"];
      datetime = data[0]["datetime"];
      progress = data[0]["progress"];
      urgent = data[0]["urgent"];
      // password = data[0]["password"];

      print(id);


      return compute(modeldetailreportFromJson, responseUser.body);
    } else {
      print("Load gagal");
    }
  }


  static fetchUpdateReport(String idReports) async{
    SharedPreferences preff = await SharedPreferences.getInstance();
    idReports = preff.getString("idReports");
    http.post(BASEURL+"updatereport.php", body:{
      "idReport" : idReports,
      "projectName" : projectName,
      "activity" : activity,
      "progress" : progress,
      "urgent" : urgent,
      "datetime" : datetime,
      "hari" : hari,

    }).then((response) async {
      print("Response update body: ${response.body}");
      data = await json.decode(response.body);
      success = data["success"];
      message = data["message"];
      print(success);

      // await scaffold_state.currentState.showSnackBar(SnackBar(
      //     content: Text(
      //       ApiProvider.message,
      //       textAlign: TextAlign.center,
      //       style: TextStyle(fontFamily: 'AirBnB'),
      //     ),
      //     duration: Duration(seconds: 2),
      //
      // ));
    });
  }

  static fetchdeleteReport(String idReports) async{
    SharedPreferences preff = await SharedPreferences.getInstance();
    idReports = preff.getString("idReports");
    http.post(BASEURL+"deletereport.php", body:{
      "idReport" : idReports,

    }).then((response) async {
      print("Response update body: ${response.body}");
      data = await json.decode(response.body);
      success = data["success"];
      message = data["message"];
      print(success);

      // await scaffold_state.currentState.showSnackBar(SnackBar(
      //     content: Text(
      //       ApiProvider.message,
      //       textAlign: TextAlign.center,
      //       style: TextStyle(fontFamily: 'AirBnB'),
      //     ),
      //     duration: Duration(seconds: 2),
      //
      // ));
    });
  }

  // API for get data users
  Future<List<Modelusers>> fetchUsers() async {

    print("masuk hisrtoy");
    print(BASEURL+"gethistorydaily.php");
    final response = await client.get(BASEURL+"getusers.php");
    if (response.statusCode == 200) {
      print(response.body);
      jsonSample = (response.body);

      return compute(modelusersFromJson, response.body);
    } else {
      print("Load gagal");
      //print(BASEURL+"gethistoryabsensi.php?id="+id);
    }
  }

  // API for get datatable
  Future<List<Modelhitoryabsensi>> fetchMonitoringAbsen(String idKaryawan) async {
    SharedPreferences preff = await SharedPreferences.getInstance();
    idKaryawan = preff.getString("idKaryawan");
    print("masuk hisrtoy");

    final response = await http.post(BASEURL+"gethistoryabsensi.php?id="+idKaryawan);
    if (response.statusCode == 200) {
      print(response.body);
      print("id history absen Apiprovider:"+idKaryawan);
      jsonSample = (response.body);

      return compute(modelhitoryabsensiFromJson, response.body);
    } else {
      print("Load gagal");
      //print(BASEURL+"gethistoryabsensi.php?id="+id);
    }
  }
// API for get datatable
  Future<List<Modelhitoryreport>> fetchMonitoringReport(String idKaryawan) async {
    SharedPreferences preff = await SharedPreferences.getInstance();
    idKaryawan = preff.getString("idKaryawan");


    print("masuk hisrtoy");
    print(BASEURL+"gethistorydaily.php?id="+idKaryawan);
    final response = await client.get(BASEURL+"gethistorydaily.php?id="+idKaryawan);
    if (response.statusCode == 200) {
      print(response.body);
      jsonSample = (response.body);

      return compute(modelhitoryreportFromJson, response.body);
    } else {
      print("Load gagal");
      //print(BASEURL+"gethistoryabsensi.php?id="+id);
    }
  }

}


