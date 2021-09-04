import 'dart:io';

import 'package:bms_mobile/bloc/dataUserBloc.dart';
import 'package:bms_mobile/bloc/detailUserbloc.dart';
import 'package:bms_mobile/palettescolor/palettescolor.dart';
import 'package:bms_mobile/resource/apiprovider.dart';
import 'package:bms_mobile/view/home/homepage.dart';
import 'package:bms_mobile/view/loginpage/login.dart';
import 'package:bms_mobile/view/menu/akun.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../menuutama.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  //untuk memunculkan text input klarasi
  TextEditingController etPassword = new TextEditingController();
  TextEditingController etDatebirth = new TextEditingController();
  TextEditingController etNohp = new TextEditingController();
  TextEditingController etName = new TextEditingController();
  TextEditingController etNik = new TextEditingController();
  TextEditingController etEmail = new TextEditingController();
  TextEditingController etLevel = new TextEditingController();


  File file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';

  // Initially password is obscure
  bool _obscureText = true;
  String _password;
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
    blocDetail.fetchdataDetail();
    _validate = false;
    getValue();
    blocDetail.fetchdataDetail();
    print(blocDetail.fetchdataDetail());
    ///bloc.fetchdataLogins();
    ///ApiProvider.fetchLogin();
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




  static GlobalKey<ScaffoldState> scaffold_state =  new GlobalKey<ScaffoldState>();

  String dataLevel;

  void ClickMenu(){
    scaffold_state.currentState.showSnackBar(SnackBar(
      content: Text(
        "Klik Menu",
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'AirBnB'),
      ),
      duration: Duration(seconds: 2),
    ));
  }
  @override
  Widget build(BuildContext context) {
    if(ApiProvider.level == 0){
      dataLevel = "Pegawai";
    }else{
      dataLevel = "Manajer";
    }

    setState(() {
      blocDetail.fetchdataDetail();
      etName.text = ApiProvider.namalengkap;
      etEmail.text = ApiProvider.email;
      etNik.text = ApiProvider.nik;
      etNohp.text = ApiProvider.nomortelepon;
    });



    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pushReplacement(new MaterialPageRoute(
                builder: (BuildContext context) => MenuUtama())),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        key: scaffold_state,
        body:
        Container(

            child: SingleChildScrollView(
              child:   Stack(

                children: [
                  Container(
                    height: height,
                  ),
                  //Untuk Mengubah Gambar background
                  ShapeOfView(
                    shape: ArcShape(
                      direction: ArcDirection.Outside,
                      height: 45,
                      position: ArcPosition.Bottom,
                    ),
                    child: Container(
                      height: height * 0.25,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/background.webp'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),


                  //untuk mengganti avatar dan nama user
                  Positioned(
                    top: 120,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        height: height * 0.2,
                        width: width * 0.3,
                        child: CircleAvatar(
                          radius: 65,
                          backgroundColor: Colors.white,
                          child: (
                               CircleAvatar(
                                  radius: 53,
                                  backgroundColor: Colors.orange,
                                  backgroundImage: AssetImage("assets/peson.png"),
                                )


                          ),
                        ),
                      ),
                    ),
                  ),

                  //untuk menu option
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.32,
                      ),
                      //input name
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey[100]))),
                        child: TextFormField(

                          controller: etName ,
                          keyboardType: TextInputType.name,
                          onChanged: (String namalengkap) {
                            ApiProvider.namalengkap = namalengkap;
                          },
                          decoration: InputDecoration(
                              errorText: _validate
                                  ? "Masukan nama lengkap anda"
                                  : null,
                              border: InputBorder.none,
                              hintText: "Nama Lengkap",
                              hintStyle: GoogleFonts.poppins(color: Color(0xFFBDBDBD)),
                              icon: const Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      top: 3.0),
                                  child: const Icon(
                                    Icons.person_outline_outlined, color: PalettesColor.redtelkomsel,))),
                        ),
                      ),
                      //input NIK
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey[100]))),
                        child: TextFormField(
                          controller: etNik,
                          keyboardType: TextInputType.number,
                          onChanged: (String nik) {
                            ApiProvider.nik = nik;
                          },
                          decoration: InputDecoration(
                              errorText: _validate
                                  ? "Masukan NIK anda"
                                  : null,
                              border: InputBorder.none,
                              hintText: "Masukan NIK anda",
                              hintStyle: GoogleFonts.poppins(color: Color(0xFFBDBDBD)),
                              icon: const Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      top: 3.0),
                                  child: const Icon(
                                    Icons.account_box_outlined, color: PalettesColor.redtelkomsel,))),
                        ),
                      ),
                      //input email
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey[100]))),
                        child: TextFormField(
                          controller: etEmail,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (String email) {
                            ApiProvider.email = email;
                          },
                          decoration: InputDecoration(
                              errorText: _validate
                                  ? "Masukan email anda"
                                  : null,
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: GoogleFonts.poppins(color: Color(0xFFBDBDBD)),
                              icon: const Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      top: 3.0),
                                  child: const Icon(
                                    Icons.mail_outline_rounded, color: PalettesColor.redtelkomsel,))),
                        ),
                      ),
                      //input Mobile phone
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey[100]))),
                        child: TextFormField(
                          controller: etNohp,
                          keyboardType: TextInputType.number,
                          onChanged: (String nomortelepon) {
                            ApiProvider.nomortelepon = nomortelepon;
                          },
                          decoration: InputDecoration(
                              errorText: _validate
                                  ? "Masukan nomor handphone anda"
                                  : null,
                              border: InputBorder.none,
                              hintText: "No Handphone",
                              hintStyle: GoogleFonts.poppins(color: Color(0xFFBDBDBD)),
                              icon: const Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      top: 3.0),
                                  child: const Icon(
                                    Icons.phone_android_rounded, color: PalettesColor.redtelkomsel,))),
                        ),
                      ),
                      // //input password
                      // Container(
                      //   padding: EdgeInsets.all(8.0),
                      //   child: TextFormField(
                      //     controller: etPassword,
                      //     onChanged: (String password) {
                      //       ApiProvider.password = password;
                      //     },
                      //     decoration: InputDecoration(
                      //         errorText: _validate
                      //             ? "Masukan password anda"
                      //             : null,
                      //         hintStyle: GoogleFonts.poppins(color: Color(0xFFBDBDBD)),
                      //         border: InputBorder.none,
                      //         hintText: "Password",
                      //         icon: const Padding(
                      //             padding:
                      //             const EdgeInsets.only(
                      //                 top: 3.0),
                      //             child:
                      //             const Icon(Icons.lock, color: PalettesColor.redtelkomsel,))),
                      //     validator: (val) => val.length < 6
                      //         ? 'Password too short.'
                      //         : null,
                      //     onSaved: (val) => _password = val,
                      //     obscureText: _obscureText,
                      //   ),
                      // ),
                      //
                      // //input Jabatan
                      // Container(
                      //     padding: EdgeInsets.all(0),
                      //     decoration: BoxDecoration(
                      //         border: Border(
                      //             bottom: BorderSide(
                      //                 color: Colors.grey[100]))),
                      //     child: Column(
                      //       children: [
                      //         Text(
                      //
                      //           'Pilih Jabatan',
                      //           style: TextStyle(fontSize: 15),
                      //         ),
                      //
                      //         GroupButton(
                      //
                      //             buttonHeight: 40,
                      //             buttonWidth: 150,
                      //             spacing: 10,
                      //             buttons: const [
                      //               'Pegawai',
                      //               'Manajer'
                      //             ],
                      //             selectedColor: Colors.redtelkomsel,
                      //             selectedBorderColor: Colors.amber,
                      //             borderRadius: BorderRadius.circular(10),
                      //             onSelected: (i, isSelected) => ApiProvider.level = '$i'
                      //
                      //           // print('Button #$i selected'),
                      //
                      //         ),
                      //       ],
                      //     )
                      //
                      //
                      // ),
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

                                  ShowDialogupdate();
                                  ///ShowDialogLogin();
                                  // Navigator.of(context).pushReplacement(new MaterialPageRoute(
                                  //     builder: (BuildContext context) => RoleSelected()));
                                });
                              },
                              child: Text(
                                  "Update Profile",
                                  style: GoogleFonts.poppins(fontSize: 20 ,color: Color(0xFFFFFFFF), fontWeight: FontWeight.w600)
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

    print(ApiProvider.email);
    print(ApiProvider.namalengkap);
    print(ApiProvider.nik);
    print(ApiProvider.nomortelepon);
    print(ApiProvider.id);
    // print(ApiProvider.password);
    // print(ApiProvider.level);

    await ApiProvider.fetchUpdateUser(idUsers);


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
              builder: (BuildContext context) => MenuUtama()));
        });
      }




    });
  }



}

