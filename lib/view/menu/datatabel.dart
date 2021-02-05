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
      body:Container(
        child:

            ListView(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:    DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Nama',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'No Telepon',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Email',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Website',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Username',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                      rows: List<Modeltables>().map((e) =>
                          DataRow(cells: [
                            DataCell(Text(e.name)),
                            DataCell(Text(e.phone)),
                            DataCell(Text(e.email)),
                            DataCell(Text(e.website)),
                            DataCell(Text(e.username)),
                          ]
                          ),
                      ).toList()
                  ),
                )
              ],
            )

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


