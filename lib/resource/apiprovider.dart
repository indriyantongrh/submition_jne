import 'dart:convert';

import 'package:bms_mobile/model/model.dart';
import 'package:bms_mobile/model/modeldetail.dart';
import 'package:bms_mobile/model/modellogin.dart';
import 'package:bms_mobile/model/modeltables.dart';
import 'package:bms_mobile/model/modeluser.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

class ApiProvider {
  Client client = Client();
  String jsonSample;
  static String name;
  static String id;
  static String namalengkap;
  static String username;
  static String email;
  static String jabatan;
  static String npp;
  static String nik;
  static String nomortelepon;
  static String level;
  static String password;
  static int success;
  static String message;
  static Map data;
  static String BASEURL = "http://api-backup-pb.acarain.com/api-jne/";
  final _BaseUrl = "https://jsonplaceholder.typicode.com/users";

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
      print(_BaseUrl);
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
        print(success);
    });

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

  static fetchUpdateUser() async{
    http.post(BASEURL+"updateuser.php", body:{
      "id" : id,
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
    });
  }
}
