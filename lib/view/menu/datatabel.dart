import 'dart:convert';

import 'package:bms_mobile/bloc/datatablesbloc.dart';
import 'package:bms_mobile/bloc/historyabsensibloc.dart';
import 'package:bms_mobile/model/modelhistoryabsensi.dart';
import 'package:bms_mobile/model/modeltables.dart';
import 'package:bms_mobile/resource/apiprovider.dart';
import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataTables extends StatefulWidget {
  @override
  _DataTablesState createState() => _DataTablesState();
}

class _DataTablesState extends State<DataTables> {

  String idUsers="";
  Future getValue() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      idUsers = pref.getString("idUsers");
    });

  }

@override
  void initState() {
    // TODO: implement initState
  ApiProvider().fetchHistoryAbsen(idUsers);
  //blocHistory.fetchHistoryabsensi();
  print("id history absen:"+idUsers);
  getValue();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    setState(() {
      ApiProvider().fetchHistoryAbsen(idUsers);
    });
    return Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: Text("History Absensi", style: TextStyle(color: Colors.white),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.lightBlue,
          elevation: 0.0,
        ),
      body:FutureBuilder(
        future: ApiProvider().fetchHistoryAbsen(idUsers),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
          }
          if (snapshot.hasData){
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              verticalDirection: VerticalDirection.down,
              children: [
                Expanded(child: Container(padding: EdgeInsets.all(5),
                child: dataBody(snapshot.data),))
              ],
            );
          }
          return Center();
        },
      )


      );

  }
}

dataBody(List<Modelhitoryabsensi> listSales) {
  return Container(
    child: ListView(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            sortColumnIndex: 0,
            showCheckboxColumn: false,
            columns: [
              DataColumn(
                  label: Text("Hari"),
                  numeric: false,
                  tooltip: "Hari"
              ),
              DataColumn(
                label: Text("Tanggal"),
                numeric: false,
                tooltip: "Tanggal",
              ),
              DataColumn(
                label: Text("Checkin"),
                numeric: false,
                tooltip: "Checkin",
              ),
              DataColumn(
                label: Text("Checkout"),
                numeric: false,
                tooltip: "Checkout",
              ),
              DataColumn(
                label: Text("Keterangan"),
                numeric: false,
                tooltip: "Keterangan",
              ),
            ],
            rows: listSales
                .map(
                  (sale) => DataRow(
                  onSelectChanged: (b) {
                    print(sale.hari);
                  },
                  cells: [
                    DataCell(
                        Text(sale.hari)
                    ),
                    DataCell(
                      Text(sale.datetime),
                    ),
                    DataCell(
                      Text(sale.checkout),
                    ),
                    DataCell(
                      Text(sale.checkout),
                    ),
                    DataCell(
                      Text(sale.keterangan),
                    ),
                  ]),
            )
                .toList(),
          ),
        )
      ],
    ),
  );

}


