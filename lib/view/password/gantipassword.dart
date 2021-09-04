
import 'package:bms_mobile/palettescolor/palettescolor.dart';
import 'package:bms_mobile/resource/apiprovider.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../menuutama.dart';

class gantipassword extends StatefulWidget {
  @override
  _gantipasswordState createState() => _gantipasswordState();
}

class _gantipasswordState extends State<gantipassword> {
  //untuk memunculkan text input klarasi
  TextEditingController etPasswordLama = new TextEditingController();
  TextEditingController etPasswordBaru = new TextEditingController();

  static GlobalKey<ScaffoldState> scaffold_state = new GlobalKey<
      ScaffoldState>();

  // Initially password is obscure

  String _password;
  String hariSekarang;
  bool _validate;
  static int valueLevel;
  String idUsers="";
  void getValue() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      idUsers = pref.getString("idUsers");

    });

  }
  void initState() {
    getValue();
    _validate = false;

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
    }else if (hari == "Friday"){
      hariSekarang = "Jumat";
    } else if (hari == "Saturday") {
      hariSekarang = "Sabtu";
    } else if (hari == "Sunday") {
      hariSekarang = "Minggu";
    }

    setState(() {
      ApiProvider.hari= hariSekarang;
    });


    final format = DateFormat("dd/MM/yyyy");
    return Scaffold(
        key: scaffold_state,
        appBar: new AppBar(
          centerTitle: true,
          title: Text("Ganti Password", style: TextStyle(color: Colors.white),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () =>Navigator.of(context).pushReplacement(new MaterialPageRoute(
    builder: (BuildContext context) => MenuUtama())),
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
                      SizedBox(height: 20,),

                      //input password lama
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey[100]))),
                        child: TextFormField(
                          controller: etPasswordLama,
                          keyboardType: TextInputType.name,
                          onChanged: (String password) {
                            ApiProvider.password = password;
                          },
                          decoration: InputDecoration(
                            // errorText: _validate
                            //     ? "Masukan nama lengkap anda"
                            //     : null,
                              border: InputBorder.none,
                              hintText: "Password lama",
                              hintStyle: GoogleFonts.poppins(color: Color(
                                  0xFFBDBDBD)),
                              icon: const Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      top: 3.0),
                                  child: const Icon(
                                    Icons.lock,
                                    color: PalettesColor.redtelkomsel,))),
                        ),
                      ),
                      //input password baru
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey[100]))),
                        child: TextFormField(
                          controller: etPasswordBaru,
                          keyboardType: TextInputType.name,
                          onChanged: (String passwordbaru) {
                            ApiProvider.passwordbaru = passwordbaru;
                          },
                          decoration: InputDecoration(
                            // errorText: _validate
                            //     ? "Masukan nama lengkap anda"
                            //     : null,
                              border: InputBorder.none,
                              hintText: "Password baru",
                              hintStyle: GoogleFonts.poppins(color: Color(
                                  0xFFBDBDBD)),
                              icon: const Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      top: 3.0),
                                  child: const Icon(
                                    Icons.lock_open,
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
                                  ShowDialogInsert();
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
                    ],
                  )

                ],
              ),
            )

        )

    );


  }

  /*Untuk show dialog login*/
  void ShowDialogInsert() async {
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

    await ApiProvider.fetchUpdatepassword(idUsers);


    new Future.delayed(new Duration(seconds: 1), () async {
      Navigator.of(context, rootNavigator: true).pop();
      await scaffold_state.currentState.showSnackBar(SnackBar(
        content: Text(
          ApiProvider.message,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'AirBnB'),
        ),
        duration: Duration(seconds: 3),
      ));

      print("massage : "+ApiProvider.message);



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