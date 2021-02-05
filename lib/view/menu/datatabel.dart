import 'dart:convert';

import 'package:bms_mobile/bloc/datatablesbloc.dart';
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
    bloc.fetchdataTabelss();
    var _dataTable = bloc.fetchdataTabelss();
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
      appBar: AppBar(
        title: Text("Data Tabel"),
        centerTitle: true,
        leading: new Container(),
      ),
      body:FutureBuilder(
        future: ApiProvider().fetchDataTables(),
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

      // StreamBuilder(
      //   stream: bloc.listSuratObject,
      //   builder: (context, AsyncSnapshot <List<Modeltables>> snapshot) {
      //     if (snapshot.hasData) {
      //       return buildList(snapshot);
      //     } else if (snapshot.hasError) {
      //       return Text(snapshot.error.toString());
      //     }
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),


  }
}

dataBody(List<Modeltables> listSales) {
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
                  label: Text("Nama"),
                  numeric: false,
                  tooltip: "Nama"
              ),
              DataColumn(
                label: Text("Username"),
                numeric: false,
                tooltip: "Username",
              ),
              DataColumn(
                label: Text("Email"),
                numeric: false,
                tooltip: "email",
              ),
              DataColumn(
                label: Text("Phone"),
                numeric: false,
                tooltip: "phone",
              ),
              DataColumn(
                label: Text("Website"),
                numeric: false,
                tooltip: "website",
              ),
            ],
            rows: listSales
                .map(
                  (sale) => DataRow(
                  onSelectChanged: (b) {
                    print(sale.username);
                  },
                  cells: [
                    DataCell(
                        Text(sale.name)
                    ),
                    DataCell(
                      Text(sale.username),
                    ),
                    DataCell(
                      Text(sale.email),
                    ),
                    DataCell(
                      Text(sale.phone),
                    ),
                    DataCell(
                      Text(sale.website),
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


