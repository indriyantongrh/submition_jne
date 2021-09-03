import 'package:bms_mobile/bloc/detailreportbloc.dart';
import 'package:bms_mobile/palettescolor/palettescolor.dart';
import 'package:bms_mobile/resource/apiprovider.dart';
import 'package:bms_mobile/view/dailyreport/historydaily.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class detailreport extends StatefulWidget {
  @override
  _detailreportState createState() => _detailreportState();
}

class _detailreportState extends State<detailreport> {
  //untuk memunculkan text input klarasi
  TextEditingController etActivity = new TextEditingController();
  TextEditingController etName = new TextEditingController();
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController etDate = TextEditingController();


  static GlobalKey<ScaffoldState> scaffold_state = new GlobalKey<
      ScaffoldState>();

  // Initially password is obscure

  String _password;
  String hariSekarang;
  bool _validate;
  static int valueLevel;

  String idReports="";
  void getValue() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      idReports = pref.getString("idReports");

    });

  }

  void initState() {
    blocDetailReport.fetchdetailReportn();
    _validate = false;
    getValue();
    etName.text = ApiProvider.projectName;
    etActivity.text = ApiProvider.activity;
    super.initState();
  }

  @override
  void dispose() {
    // etName.dispose();
    // etNik.dispose();
    // etEmail.dispose();
    // etNohp.dispose();
    // etPassword.dispose();
    // etLevel.dispose();
    super.dispose();
  }

  // Unrutuk dropdown progress
  Progress selectedProgress;
  List<Progress> progresses = [
    Progress("Progress"),
    Progress("Done"),
  ];

  List<DropdownMenuItem> generateItems(List<Progress> progresses) {
    List<DropdownMenuItem> items = [];
    for (var item in progresses) {
      items.add(DropdownMenuItem(child: Text(item.progress), value: item,));
    }
    return items;
  }

  // Unrutuk dropdown urgent
  Urgent selectedUrgent;
  List<Urgent> urgents = [
    Urgent("Low"),
    Urgent("Medium"),
    Urgent("Hard"),
  ];

  List<DropdownMenuItem> generateItemsUrgent(List<Urgent> urgents) {
    List<DropdownMenuItem> items = [];
    for (var item in urgents) {
      items.add(DropdownMenuItem(child: Text(item.nameUrgent), value: item,));
    }
    return items;
  }

  // Unrutuk dropdown kategori
  Kategori selectedKategori;
  List<Kategori> kategoris = [
    Kategori("Backlog"),
    Kategori("Bug"),
    Kategori("Development"),
  ];

  List<DropdownMenuItem> generateItemsKategori(List<Kategori> kategoris) {
    List<DropdownMenuItem> items = [];
    for (var item in kategoris) {
      items.add(DropdownMenuItem(child: Text(item.nameKategori), value: item,));
    }
    return items;
  }

  DateTime date;
  String strDate;
  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date ?? now,
        firstDate: now,
        lastDate: DateTime(2101));
    if (picked != null && picked != date) {
      print('hello $picked');
      setState(() {
        date = picked;
        String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
        print(formattedDate);
        setState(() {
          _textEditingController.text = formattedDate;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime Tanggall;
    String tanggal;
    var _date = DateTime.now();
    DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd MMMM yyyy');
    final String formatted = formatter.format(now);

    String formattedDate = DateFormat('kk:mm:ss').format(now);
    // Mengambil data hari
    final DateFormat formathari = DateFormat('EEEE');
    final String hari = formathari.format(now);
    if (hari == "Monday") {
      hariSekarang = "Senin";
    } else if (hari == "Tuesday") {
      hariSekarang = "Selasa";
    } else if (hari == "Wednesday") {
      hariSekarang = "Rabu";
    } else if (hari == "Thursday") {
      hariSekarang = "Kamis";
    }else if (hari == "Friday"){
      hariSekarang = "Jumat";
    } else if (hari == "Saturday") {
      hariSekarang = "Sabtu";
    } else if (hari == "Sunday") {
      hariSekarang = "Minggu";
    }

    setState(() {

      ApiProvider.hari = hariSekarang;
     etName.text = ApiProvider.projectName;

     etActivity.text = ApiProvider.activity;
    });

    final format = DateFormat("dd/MM/yyyy");
    return Scaffold(
        key: scaffold_state,
        appBar: new AppBar(
          centerTitle: true,
          title: Text("Daily Report", style: TextStyle(color: Colors.white),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.lightBlue,
          elevation: 0.0,
        ),
        body:
        Container(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 30,),
                      Text("Detai Daily Activity" ,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30, fontFamily: 'AirBnB') ,),
                      SizedBox(height: 20,),

                      //input datetime
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey[100]))),
                        child:
                        DateTimeField(
                          //controller: alamat.controller,
                          format: format,
                          onChanged: (dt) {
                            setState(() => Tanggall = dt);
                            ApiProvider.datetime = '$Tanggall';
                            print('Selected date: $Tanggall');
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: ApiProvider.datetime,
                              hintStyle: GoogleFonts.poppins(color: Colors.black),
                              icon: const Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      top: 3.0),
                                  child: const Icon(
                                    Icons.date_range,
                                    color: PalettesColor.redtelkomsel,))


                          ),
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate:
                                currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                          },
                        ),

                      ),
                      //input name
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey[100]))),
                        child: TextFormField(
                          controller: etName,
                          keyboardType: TextInputType.name,
                          onChanged: (String projectName) {
                            ApiProvider.projectName = projectName;
                          },
                          decoration: InputDecoration(
                            // errorText: _validate
                            //     ? "Masukan nama lengkap anda"
                            //     : null,
                              border: InputBorder.none,
                              hintText: "Nama Project",
                              hintStyle: GoogleFonts.poppins(color: Color(
                                  0xFFBDBDBD)),
                              icon: const Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      top: 3.0),
                                  child: const Icon(
                                    Icons.assessment_rounded,
                                    color: PalettesColor.redtelkomsel,))),
                        ),
                      ),
                      //input activity
                      SizedBox(height: 100,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey[100]))),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            controller: etActivity,
                            onChanged: (String activity) {
                              ApiProvider.activity = activity;
                            },
                            decoration: InputDecoration(
                              // errorText: _validate
                              //     ? "Masukan NIK anda"
                              //     : null,
                                border: InputBorder.none,
                                hintText: "Masukan acivitas anda",
                                hintStyle: GoogleFonts.poppins(color: Color(
                                    0xFFBDBDBD)),
                                icon: const Padding(
                                    padding:
                                    const EdgeInsets.only(
                                        top: 3.0),
                                    child: const Icon(
                                      Icons.local_activity_outlined,
                                      color: PalettesColor.redtelkomsel,))),
                          ),
                        ),),

                      //dropdown progress
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey[100]))),
                        child: DropdownButtonFormField(
                          value: selectedProgress,
                          items: generateItems(progresses),
                          onChanged: (item) {
                            setState(() {
                              selectedProgress = item;
                              ApiProvider.progress = selectedProgress.progress;
                              print(selectedProgress.progress);
                            });
                          },
                          decoration: InputDecoration(
                            // errorText: _validate
                            //     ? "Masukan NIK anda"
                            //     : null,

                              hintText: ApiProvider.progress,
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.poppins(color: Colors.black),
                              icon: const Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      top: 3.0),
                                  child: const Icon(
                                    Icons.add_alarm_outlined,
                                    color: PalettesColor.redtelkomsel,))),
                        ),
                      ),
                      //dropdown urgent
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey[100]))),
                        child: DropdownButtonFormField(
                          value: selectedUrgent,
                          items: generateItemsUrgent(urgents),
                          onChanged: (item) {
                            setState(() {
                              selectedUrgent = item;
                              ApiProvider.urgent = selectedUrgent.nameUrgent;
                              print(selectedUrgent.nameUrgent);
                            });
                          },
                          decoration: InputDecoration(
                            // errorText: _validate
                            //     ? "Masukan NIK anda"
                            //     : null,
                              hintText: ApiProvider.urgent,
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.poppins(color: Colors.black),
                              icon: const Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      top: 3.0),
                                  child: const Icon(
                                    Icons.alarm_on,
                                    color: PalettesColor.redtelkomsel,))),
                        ),
                      ),


                      SizedBox(height: 30,),
                      //button registrer
                      Row(

                        children: [
                         SizedBox(
                           width: 280,
                           child:  Container(
                               height: 50,
                               margin:
                               EdgeInsets.symmetric(horizontal: 30),
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   color: Colors.lightBlueAccent),
                               child:
                               Center(
                                 child:
                                 GestureDetector(
                                   onTap: () {
                                     setState(() {
                                       ShowDialogupdate();

                                     });
                                   },
                                   child: Text(
                                       "Update",
                                       style: GoogleFonts.poppins(fontSize: 20,
                                           color: Color(0xFFFFFFFF),
                                           fontWeight: FontWeight.w600)
                                   ),
                                 ),
                               )),
                         ),
                          FlatButton(

                              onPressed: (){
                                setState(() {
                                  ShowDialogdelete();
                                });
                              },
                              child:  const Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      ),
                                  child: const Icon(
                                    Icons.restore_from_trash,
                                    color: PalettesColor.redtelkomsel,
                                  size: 50,)),
                            ),

                        ],
                      ),

                    ],
                  )

                ],
              ),
            )

        )

    );
  }

  /*Untuk show dialog Update*/
  void ShowDialogupdate() async {
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

    print("id : "+idReports);
    print("name : "+ApiProvider.projectName);
    print("date : "+ApiProvider.datetime);
    print("hari : "+ApiProvider.hari);
    print("activity : "+ApiProvider.activity);
    print("progress : "+ApiProvider.progress);
    print("urgent : "+ApiProvider.urgent);

    await ApiProvider.fetchUpdateReport(idReports);


    new Future.delayed(new Duration(seconds: 3), () async {
      Navigator.of(context, rootNavigator: true).pop();
      await scaffold_state.currentState.showSnackBar(SnackBar(
        content: Text(
          ApiProvider.message,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'AirBnB'),
        ),
        // duration: Duration(seconds: 2),
      ));
      if(ApiProvider.success == 1){
        Future.delayed(Duration(seconds: 1), (){
          Navigator.of(context).pushReplacement(new MaterialPageRoute(
              builder: (BuildContext context) => historydaily()));
        });
      }
    });
  }

  /*Untuk show dialog delete*/
  void ShowDialogdelete() async {
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




    await ApiProvider.fetchdeleteReport(idReports);


    new Future.delayed(new Duration(seconds: 3), () async {
      Navigator.of(context, rootNavigator: true).pop();
      await scaffold_state.currentState.showSnackBar(SnackBar(
        content: Text(
          ApiProvider.message,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'AirBnB'),
        ),
        // duration: Duration(seconds: 2),
      ));
      if(ApiProvider.success == 1){
        Future.delayed(Duration(seconds: 1), (){
          Navigator.of(context).pushReplacement(new MaterialPageRoute(
              builder: (BuildContext context) => historydaily()));
        });
      }
    });
  }
}




class Progress {
  String progress;

  Progress(this.progress);
}

class Urgent {
  String nameUrgent;

  Urgent(this.nameUrgent);
}

class Kategori {
  String nameKategori;

  Kategori(this.nameKategori);
}