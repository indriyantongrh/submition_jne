import 'dart:convert';

import 'package:bms_mobile/bloc/datatablesbloc.dart';
import 'package:bms_mobile/bloc/historyabsensibloc.dart';
import 'package:bms_mobile/model/modelhistoryabsensi.dart';
import 'package:bms_mobile/model/modeltables.dart';
import 'package:bms_mobile/resource/apiprovider.dart';
import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';

class DataTables extends StatefulWidget {
  @override
  _DataTablesState createState() => _DataTablesState();
}

class _DataTablesState extends State<DataTables> {


@override
  void initState() {
    // TODO: implement initState
  blocHistory.fetchHistoryabsensi();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
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
        future: ApiProvider().fetchHistoryAbsen(),
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

// Widget buildList(AsyncSnapshot<List<Modeltables>> snapshot) {
// return Container(
//   child: ListView.separated(
//       itemCount:  snapshot.data.length,
//       separatorBuilder: (context, index) {
//         return Divider(
//           color: Color(0xFF6AB8C9),
//         );
//       },
//
//       itemBuilder: (context, index) {
//         return ListView(
//             children: <Widget>[
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child:  DataTable(
//
//                   columns: const <DataColumn>[
//                     DataColumn(
//                       numeric: true,
//                       label: Text(
//                         'Nama',
//                         style: TextStyle(fontStyle: FontStyle.italic),
//                       ),
//                     ),
//                     DataColumn(
//                       label: Text(
//                         'Email',
//                         style: TextStyle(fontStyle: FontStyle.italic),
//                       ),
//                     ),
//                     DataColumn(
//                       label: Text(
//                         'Nomor Handphone',
//                         style: TextStyle(fontStyle: FontStyle.italic),
//                       ),
//                     ),
//                     DataColumn(
//                       label: Text(
//                         'Website',
//                         style: TextStyle(fontStyle: FontStyle.italic),
//                       ),
//                     ),
//                     DataColumn(
//                       label: Text(
//                         'Username',
//                         style: TextStyle(fontStyle: FontStyle.italic),
//                       ),
//                     ),
//                   ],
//                   rows: bloc.listSuratObject.map((snapshot) =>
//                       DataRow(
//
//                       )
//                   ).toList()
//                 ),
//               )
//             ]
//         );
//     })
// );
// }


