

import 'package:bms_mobile/resource/apiprovider.dart';
import 'package:bms_mobile/view/loginpage/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bms_mobile/palettescolor/palettescolor.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter/widgets.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  //untuk memunculkan text input klarasi
  TextEditingController etPassword = new TextEditingController();
  TextEditingController etDatebirth = new TextEditingController();
  TextEditingController etNohp = new TextEditingController();
  TextEditingController etName = new TextEditingController();
  TextEditingController etNik = new TextEditingController();
  TextEditingController etEmail = new TextEditingController();
  TextEditingController etLevel = new TextEditingController();

  // Initially password is obscure
  bool _obscureText = true;
  String _password;
  bool _validate;
  static int valueLevel;




  static GlobalKey<ScaffoldState> scaffold_state_register = new GlobalKey<ScaffoldState>();

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    _validate = false;


    ///bloc.fetchdataLogins();
    ///ApiProvider.fetchLogin();
    super.initState();
  }

  @override
  void dispose() {
    etName.dispose();
    etNik.dispose();
    etEmail.dispose();
    etNohp.dispose();
    etPassword.dispose();
    etLevel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     key: scaffold_state_register,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.webp"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Register dulu",
                      style:GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w400, color: Color(0xFFFAFAFA))
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: <Widget>[

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
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: etPassword,
                                          onChanged: (String password) {
                                            ApiProvider.password = password;
                                          },
                                          decoration: InputDecoration(
                                              errorText: _validate
                                                  ? "Masukan password anda"
                                                  : null,
                                              hintStyle: GoogleFonts.poppins(color: Color(0xFFBDBDBD)),
                                              border: InputBorder.none,
                                              hintText: "Password",
                                              icon: const Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 3.0),
                                                  child:
                                                  const Icon(Icons.lock, color: PalettesColor.redtelkomsel,))),
                                          validator: (val) => val.length < 6
                                              ? 'Password too short.'
                                              : null,
                                          onSaved: (val) => _password = val,
                                          obscureText: _obscureText,
                                        ),
                                      ),

                                      //input Jabatan
                                      Container(
                                        padding: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[100]))),
                                        child: Column(
                                          children: [
                                            Text(

                                              'Pilih Jabatan',
                                              style: TextStyle(fontSize: 15),
                                            ),

                                            GroupButton(

                                              buttonHeight: 40,
                                              buttonWidth: 150,
                                              spacing: 10,
                                              buttons: const [
                                                'Pegawai',
                                                'Manajer'
                                              ],
                                              selectedColor: Colors.redtelkomsel,
                                              selectedBorderColor: Colors.amber,
                                              borderRadius: BorderRadius.circular(10),
                                              onSelected: (i, isSelected) => ApiProvider.level = '$i'

                                                  // print('Button #$i selected'),

                                            ),
                                          ],
                                        )


                                        ),



                                    ],
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
                                            setState(() {
                                              etName.text.isEmpty
                                                  ? _validate = true
                                                  : _validate = false;
                                              etPassword.text.isEmpty
                                                  ? _validate = true
                                                  : _validate = false;
                                              if (etNohp.text.isNotEmpty &&
                                                  etPassword.text.isNotEmpty) {
                                                ShowDialogRegister();
                                              }
                                            });

                                            ///ShowDialogLogin();
                                            // Navigator.of(context).pushReplacement(new MaterialPageRoute(
                                            //     builder: (BuildContext context) => RoleSelected()));
                                          });
                                        },
                                        child: Text(
                                            "Register",
                                            style: GoogleFonts.poppins(fontSize: 20 ,color: Color(0xFFFFFFFF), fontWeight: FontWeight.w600)
                                        ),
                                      ),
                                    )),

                                SizedBox(
                                  height: 50,
                                ),
                                Container(
                                    height: 50,
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          Navigator.of(context).push(new MaterialPageRoute(
                                              builder: (BuildContext context) => Login()));
                                        });
                                      },
                                      child:  Center(
                                        child: Text(
                                            "Silahkan login",
                                            style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w300)
                                        ),
                                      ),
                                    )),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*Untuk show dialog login*/
  void ShowDialogRegister() async {
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
    print(ApiProvider.password);
    print(ApiProvider.level);

    await ApiProvider.fetchregister();
    new Future.delayed(new Duration(seconds: 3), () async {
      Navigator.of(context, rootNavigator: true).pop();
      await scaffold_state_register.currentState.showSnackBar(SnackBar(
        content: Text(
          ApiProvider.message,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'AirBnB'),
        ),
        ///duration: Duration(seconds: 2),
      ));
      if (ApiProvider.success == 1) {
        /* Navigator.of(context).pushReplacement(new MaterialPageRoute(
            builder: (BuildContext context) => SelectedRole()));*/

          Future.delayed(Duration(seconds: 1), (){
            Navigator.of(context).pushReplacement(new MaterialPageRoute(
                builder: (BuildContext context) => Login()));
          });

      } else {
        print(ApiProvider.message);
      }


    });
  }
}

