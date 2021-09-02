import 'dart:async';

import 'package:analog_clock/analog_clock.dart';
import 'package:bms_mobile/bloc/detailabsenbloc.dart';
import 'package:bms_mobile/resource/apiprovider.dart';
import 'package:flutter/material.dart';
import 'package:circle_button/circle_button.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:intl/intl.dart';

class absensi extends StatefulWidget {
  @override
  _absensiState createState() => _absensiState();
}

class _absensiState extends State<absensi> {
  DateTime _timeOfDay = DateTime.now();
  // String formattedDate = DateFormat('dd/MM/yyyy – kk:mm').format(_timeOfDay);
  bool visibilityTag = true;
  String hariSekarang;
  String keterangan;
  String dataCheckout_2;
  static GlobalKey<ScaffoldState> scaffold_state =  new GlobalKey<ScaffoldState>();

  String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    blocAbsen.fetchdetailAbsen();
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
     final DateTime now = DateTime.now();
     final DateFormat formatter = DateFormat('dd MMMM yyyy');
    final String formatted = formatter.format(now);

     String formattedDate = DateFormat('kk:mm:ss').format(now);
    // Mengambil data hari
      final DateFormat formathari = DateFormat('EEEE');
     final String hari = formathari.format(now);
    if (hari == "Monday"){
      hariSekarang = "Senin";
    }else if (hari == "Tuesday"){
      hariSekarang = "Selasa";
    }else if (hari == "Wednesday"){
      hariSekarang = "Rabu";
    }else if (hari == "Thursday"){
      hariSekarang = "Kamis";
    }else if (hari == "Tuesday"){
      hariSekarang = "Jumat";
    }else if (hari == "Saturday"){
      hariSekarang = "Sabtu";
    }else if (hari == "Sunday"){
      hariSekarang = "Minggu";
    }

      var ketHour = now.hour;
     if (ketHour > 8) {
       keterangan = "Terlambat";

     } else if (ketHour < 8) {
       keterangan = "Ontime";

     }

    setState(() {
      ApiProvider.checkin = formattedDate;
      ApiProvider.checkout = formatted;
      ApiProvider.datetime = formatted;
      ApiProvider.hari = hariSekarang;
      ApiProvider.keterangan = keterangan;
      ApiProvider.checkout = formattedDate;




    });
     String dataCheckin = ApiProvider.checkin_2;
     String dataCheckout = ApiProvider.checkout_2;
     if(dataCheckout== null){
       dataCheckout_2 = "00:00:00";
     }else{
       dataCheckout_2 = dataCheckout;
     }
    return Scaffold(
      key: scaffold_state,
      appBar: new AppBar(
        centerTitle: true,
        title: Text("Absensi", style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.lightBlue,
        elevation: 0.0,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text("e - Absensi" ,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30, fontFamily: 'AirBnB') ,),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Center(
                    child: Column(
                      children: [
                        CircleButton(
                          onTap: (){
                            setState(() {
                              ShowDialogInsertAbsen();
                            });
                          },
                          tooltip: 'absen',
                          width: 100.0,
                          height: 100.0,
                          borderColor: Colors.white,

                          backgroundColor: Colors.redtelkomsel,
                          child:
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                            size: 100,
                          ),
                        ),
                        Text("Checkin",
                          style: TextStyle(fontSize: 20, fontFamily: 'AirBnB'),),
                      ],
                    ),
                  ),
                  SizedBox(width: 40,),
                  Center(
                    child: Column(
                      children: [
                        Visibility(
                          //visible: visibilityTag,
                            child: Center(
                              child: Column(
                                children: [
                                  // SizedBox(height: 20,),
                                  CircleButton(
                                    onTap: (){
                                      setState(() {
                                        ShowDialogUpdateAbsen();
                                      });
                                    },
                                    tooltip: 'absen',
                                    width: 100.0,
                                    height: 100.0,
                                    borderColor: Colors.white,

                                    backgroundColor: Colors.green,
                                    child:
                                    Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.white,
                                      size: 100,
                                    ),
                                  ),
                                  Text("Checkout",
                                    style: TextStyle(fontSize: 20, fontFamily: 'AirBnB'),),
                                ],
                              )

                              ,
                            )),

                      ],
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.black87, height:40,),

               Text(formatted,
               style: TextStyle(fontSize: 30, fontFamily: 'AirBnB', fontWeight: FontWeight.w500),),
              Text(formattedDate,
                style: TextStyle(fontSize: 30, fontFamily: 'AirBnB', fontWeight: FontWeight.w100),),
              SizedBox(height: 30,),

              //jam checkout dan checkin
              // Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              //
              //   children: [
              //     Center(
              //       child: Column(
              //         children: [
              //           Text("Jam Checkin",style: TextStyle(fontSize: 20, fontFamily: 'AirBnB', fontWeight: FontWeight.w500),),
              //           Text(dataCheckin?? "00:00:00",style: TextStyle(fontSize: 20, fontFamily: 'AirBnB', fontWeight: FontWeight.w100),),
              //
              //         ],
              //       ),
              //     ),
              //     SizedBox(width: 30,),
              //     Center(
              //       child: Column(
              //         children: [
              //           Text("Jam Checkout",style: TextStyle(fontSize: 20, fontFamily: 'AirBnB', fontWeight: FontWeight.w500),),
              //           Text(dataCheckout_2?? '00:00:00'
              //             ,style: TextStyle(fontSize: 20, fontFamily: 'AirBnB', fontWeight: FontWeight.w100),),
              //
              //         ],
              //       ),
              //     ),
              //   ],
              // )


            ],
          ),
        )
      ),
    );
  }

  /*Untuk show dialog login*/
  void ShowDialogInsertAbsen() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        child: new Dialog(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 60),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: new CircularProgressIndicator(),
                ),
                new Text("     Loading..."),
              ],
            ),
          ),
        ));

    print(ApiProvider.datetime);
    print(ApiProvider.checkin);
    print(ApiProvider.keterangan);
    print(ApiProvider.hari);
    // print(ApiProvider.password);
    // print(ApiProvider.level);

    await ApiProvider.fetchAbsensi();

    new Future.delayed(new Duration(seconds: 1), () async {
      Navigator.of(context, rootNavigator: true).pop();
      await scaffold_state.currentState.showSnackBar(SnackBar(
        content: Text(
          ApiProvider.message,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'AirBnB'),
        ),
        //duration: Duration(seconds: 2),

      ));
      if(ApiProvider.success == 1){
        Future.delayed(Duration(seconds: 1), (){
          blocAbsen.fetchdetailAbsen();
        });
      }

      print("massage : "+ApiProvider.message);

    });
  }

  /*Untuk show dialog login*/
  void ShowDialogUpdateAbsen() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        child: new Dialog(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 60),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: new CircularProgressIndicator(),
                ),
                new Text("     Loading..."),
              ],
            ),
          ),
        ));

    print(ApiProvider.datetime);
    print(ApiProvider.id);
    print(ApiProvider.checkin);
    print(ApiProvider.checkout);
    print(ApiProvider.keterangan);
    print(ApiProvider.hari);
    // print(ApiProvider.password);
    // print(ApiProvider.level);

    await ApiProvider.fetchUpdateAbsen();

    new Future.delayed(new Duration(seconds: 1), () async {
      Navigator.of(context, rootNavigator: true).pop();
      await scaffold_state.currentState.showSnackBar(SnackBar(
        content: Text(
          ApiProvider.message,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'AirBnB'),
        ),
        //duration: Duration(seconds: 2),

      ));
      // if(ApiProvider.success == 1){
      //   Future.delayed(Duration(seconds: 1), (){
      //     blocAbsen.fetchdetailAbsen();
      //   });
      // }

      print("massage : "+ApiProvider.message);

    });
  }
}
