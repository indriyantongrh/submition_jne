import 'dart:convert';

import 'package:bms_mobile/model/modeltables.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;


class ApiProvider {
  Client client = Client();
  String jsonSample;
  final _BaseUrl ="https://api.mocki.io/v1/5ce8761e";


  Future <List<Modeltables>> fetchDataTables() async{
    print("masuk");
    print(_BaseUrl);
    final response = await client.get(_BaseUrl);
    if(response.statusCode  == 200){
      print(response.body);
       jsonSample=(response.body);

      return compute(modeltablesFromJson, response.body);


    }else{
      print("Load gagal");
      print(_BaseUrl);

    }
  }
}
