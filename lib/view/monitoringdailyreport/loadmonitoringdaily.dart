import 'dart:convert';

import 'package:bms_mobile/bloc/datatablesbloc.dart';
import 'package:bms_mobile/bloc/historyabsensibloc.dart';
import 'package:bms_mobile/model/modelhistoryabsensi.dart';
import 'package:bms_mobile/model/modelhistoryreport.dart';
import 'package:bms_mobile/model/modeltables.dart';
import 'package:bms_mobile/resource/apiprovider.dart';
import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loadmonitoringdaily extends StatefulWidget {
  @override
  _loadmonitoringdailyState createState() => _loadmonitoringdailyState();
}

class _loadmonitoringdailyState extends State<loadmonitoringdaily> {

  String idKaryawan="";
  String idUsers="";
  Future getValue() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      idKaryawan = pref.getString("idKaryawan");
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    // ApiProvider().fetchHistoryAbsen(idUsers);
    // //blocHistory.fetchHistoryabsensi();
    // print("id history absen:"+idUsers);
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
      // ApiProvider().fetchHistoryAbsen(idUsers);
      ///idUsers = idKaryawan;
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
          future: ApiProvider().fetchMonitoringReport(idKaryawan),
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

dataBody(List<Modelhitoryreport> listSales) {
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
                label: Text("Nama Project"),
                numeric: false,
                tooltip: "Nama Project",
              ),
              DataColumn(
                label: Text("Activity"),
                numeric: false,
                tooltip: "Activity",
              ),
              DataColumn(
                label: Text("Progress"),
                numeric: false,
                tooltip: "Progress",
              ),
              DataColumn(
                label: Text("Prioritas"),
                numeric: false,
                tooltip: "Prioritas",
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
                      Text(sale.projectName),
                    ),
                    DataCell(
                      Text(sale.activity),
                    ),
                    DataCell(
                      Text(sale.progress),
                    ),
                    DataCell(
                      Text(sale.urgent),
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


