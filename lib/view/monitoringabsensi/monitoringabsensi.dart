import 'package:bms_mobile/bloc/historyreportbloc.dart';
import 'package:bms_mobile/model/modelhistoryreport.dart';
import 'package:bms_mobile/model/modelusers.dart';
import 'package:bms_mobile/view/dailyreport/detailreport.dart';
import 'package:bms_mobile/view/monitoringabsensi/loadmonitoringabsensi.dart';
import 'package:f_datetimerangepicker/f_datetimerangepicker.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:bms_mobile/bloc/datatablesbloc.dart';
import 'package:bms_mobile/bloc/historyabsensibloc.dart';
import 'package:bms_mobile/model/modelhistoryabsensi.dart';
import 'package:bms_mobile/model/modeltables.dart';
import 'package:bms_mobile/resource/apiprovider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:json_table/json_table.dart';
import 'package:shared_preferences/shared_preferences.dart';


class monitoringabsensi extends StatefulWidget {
  @override
  _monitoringabsensiState createState() => _monitoringabsensiState();
}

class _monitoringabsensiState extends State<monitoringabsensi> {

  String idUsers="";
  void getValue() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      idUsers = pref.getString("idUsers");

    });

  }

  @override
  void initState() {
    // TODO: implement initState
    ///blocHistoryreport.fetchHistoryReport();
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


    return Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: Text("Monitoring Absensi", style: TextStyle(color: Colors.white),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.lightBlue,
          elevation: 0.0,
        ),
        body:


        FutureBuilder <List<Modelusers>>(
          future: ApiProvider().fetchUsers(),
          builder: (context, snapshot){
            if(!snapshot.hasData ){
              return Center(child: CircularProgressIndicator(),);

            }

            if(snapshot.data == null ){
              return Center(child: Text("Kosong"),);
            }
            if (snapshot.hasData){
              List<Modelusers> data = snapshot.data;
              return
                ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return
                        GestureDetector(
                            onTap: () async{
                              ApiProvider.urgent   = data[index].id;
                              SharedPreferences preff = await SharedPreferences.getInstance();
                              await preff.setString("idKaryawan", data[index].id);
                              // print(data[index].idReport);
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) => loadmonitoringabsensi()));
                            },
                            child: Container(
                              height: 100,
                              child:   Card(
                                child:
                                Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      child:  Row(
                                        children: [
                                          new CircleAvatar(
                                            radius: 30,
                                            backgroundColor: Colors.redtelkomsel,
                                            child: CircleAvatar(
                                              radius: 30,
                                              backgroundColor: Colors.white70,
                                              backgroundImage:
                                              AssetImage("assets/peson.png"),
                                            ),
                                          ),
                                          SizedBox(width: 10,),

                                          Column(

                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data[index].namalengkap,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),

                                              SizedBox(
                                                height: 4,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    data[index].email,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 12
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                ],
                                              )

                                            ],
                                          ),
                                        ],
                                      ),),

                                    Container(
                                        padding: EdgeInsets.only(right: 15),
                                        alignment: Alignment.centerRight,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child:   Text(
                                            data[index].jabatan,
                                            textAlign: TextAlign.right,
                                            style: GoogleFonts.poppins(
                                              fontSize: 20,
                                              color: Color(0xFF218B5F),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            )

                        );

                    });
            }
          },
        )
    );
  }
}

