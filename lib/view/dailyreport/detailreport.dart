import 'package:bms_mobile/bloc/detailreportbloc.dart';
import 'package:bms_mobile/palettescolor/palettescolor.dart';
import 'package:bms_mobile/resource/apiprovider.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class detailreport extends StatefulWidget {
  @override
  _detailreportState createState() => _detailreportState();
}

class _detailreportState extends State<detailreport> {
  //untuk memunculkan text input klarasi
  TextEditingController etActivity = new TextEditingController();
  TextEditingController etName = new TextEditingController();

  static GlobalKey<ScaffoldState> scaffold_state = new GlobalKey<
      ScaffoldState>();

  // Initially password is obscure

  String _password;
  String hariSekarang;
  bool _validate;
  static int valueLevel;

  void initState() {
    blocDetailReport.fetchdetailReportn();
    _validate = false;
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
    } else if (hari == "Tuesday") {
      hariSekarang = "Jumat";
    } else if (hari == "Saturday") {
      hariSekarang = "Sabtu";
    } else if (hari == "Sunday") {
      hariSekarang = "Minggu";
    }

    setState(() {
      //blocDetailReport.fetchdetailReportn();
     // selectedProgress = ApiProvider.progress;
      ///Tanggall = ApiProvider.datetime;
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
                      Text("Input Daily Activity" ,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30, fontFamily: 'AirBnB') ,),
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
                              hintText: "Masukan Tanggal",
                              hintStyle: GoogleFonts.poppins(color: Color(
                                  0xFFBDBDBD)),
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

                              hintText: "Pilih Progress",
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.poppins(color: Color(
                                  0xFFBDBDBD)),
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
                              hintText: "Pilih Prioritas",
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.poppins(color: Color(
                                  0xFFBDBDBD)),
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
                      Container(
                          height: 50,
                          margin:
                          EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.redtelkomsel),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                 // ShowDialogInsert();
                                  //ShowDialogupdate();
                                  ///ShowDialogLogin();
                                  // Navigator.of(context).pushReplacement(new MaterialPageRoute(
                                  //     builder: (BuildContext context) => RoleSelected()));
                                });
                              },
                              child: Text(
                                  "Simpan",
                                  style: GoogleFonts.poppins(fontSize: 20,
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w600)
                              ),
                            ),
                          )),
                    ],
                  )

                ],
              ),
            )

        )

    );
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