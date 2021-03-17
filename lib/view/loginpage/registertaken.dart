import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bms_mobile/palettescolor/palettescolor.dart';
import 'package:intl/intl.dart';

class RegisterTakenAja extends StatefulWidget {
  @override
  _RegisterTakenAjaState createState() => _RegisterTakenAjaState();
}

class _RegisterTakenAjaState extends State<RegisterTakenAja> {

  //untuk memunculkan text input klarasi
  TextEditingController etNpp = new TextEditingController();
  TextEditingController etPassword = new TextEditingController();
  TextEditingController etDatebirth = new TextEditingController();

  // Initially password is obscure
  bool _obscureText = true;
  String _password;
  bool _validate;
  String dropdownValue = 'Pilih Jenis Kelamin';
  /// Defaults to today's date.
  DateTime _selectedDate = DateTime.now();
  final formatDate = new DateFormat('yyyy-MM-dd');

  List <String> spinnerItems = [
    'Pilih Jenis Kelamin',
    'Laki-laki',
    'Perempuan',
  ];

  static GlobalKey<ScaffoldState> scaffold_state =
  new GlobalKey<ScaffoldState>();

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
    etNpp.dispose();
    etPassword.dispose();
    super.dispose();
  }

  _selectDated(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate, // Refer step 1
      firstDate: DateTime(1900),
      lastDate: DateTime(2040),
    );
    if (picked != null) {
      _selectedDate = picked;
      etDatebirth
        ..text = formatDate.format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: etDatebirth.text.length,
            affinity: TextAffinity.upstream));
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "Register TekenAja",
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
                                      //input email
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[100]))),
                                        child: TextFormField(
                                          controller: etNpp,
                                          keyboardType: TextInputType.emailAddress,
                                          // onChanged: (String user) {
                                          //   ApiProvider.npp = user;
                                          // },
                                          decoration: InputDecoration(
                                              errorText: _validate
                                                  ? "Masukan NPP anda"
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
                                      //input name
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[100]))),
                                        child: TextFormField(
                                          //controller: etNpp,
                                          keyboardType: TextInputType.name,
                                          // onChanged: (String user) {
                                          //   ApiProvider.npp = user;
                                          // },
                                          decoration: InputDecoration(
                                              errorText: _validate
                                                  ? "Masukan NPP anda"
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
                                      //input gender
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        child:
                                        DropdownButton(
                                          value: dropdownValue,
                                          icon: Icon(Icons.arrow_drop_down),
                                          iconSize: 24,
                                          elevation: 16,
                                          style: TextStyle(color: Colors.red, fontSize: 18),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.deepPurpleAccent,
                                          ),
                                          onChanged: (String data) {
                                            setState(() {
                                              dropdownValue = data;
                                            });
                                          },
                                          items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),

                                        )
                                      ),
                                      //input datetime
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[100]))),
                                        child: TextFormField(
                                          onTap: () {
                                            _selectDated(context);
                                          },
                                          controller: etDatebirth,
                                          keyboardType: TextInputType.name,
                                          // onChanged: (String user) {
                                          //   ApiProvider.npp = user;
                                          // },
                                          decoration: InputDecoration(
                                              errorText: _validate
                                                  ? "Masukan NPP anda"
                                                  : null,
                                              border: InputBorder.none,
                                              hintText: "Tanggal Lahir",
                                              hintStyle: GoogleFonts.poppins(color: Color(0xFFBDBDBD)),
                                              icon: const Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 3.0),
                                                  child: const Icon(
                                                    Icons.date_range_outlined, color: PalettesColor.redtelkomsel,))),
                                        ),
                                      ),
                                      //input place birth
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[100]))),
                                        child: TextFormField(
                                         /// controller: etNpp,
                                          keyboardType: TextInputType.name,
                                          // onChanged: (String user) {
                                          //   ApiProvider.npp = user;
                                          // },
                                          decoration: InputDecoration(
                                              errorText: _validate
                                                  ? "Masukan NPP anda"
                                                  : null,
                                              border: InputBorder.none,
                                              hintText: "Tempat Lahir",
                                              hintStyle: GoogleFonts.poppins(color: Color(0xFFBDBDBD)),
                                              icon: const Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 3.0),
                                                  child: const Icon(
                                                    Icons.place_rounded, color: PalettesColor.redtelkomsel,))),
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
                                         /// controller: etNpp,
                                          keyboardType: TextInputType.number,
                                          // onChanged: (String user) {
                                          //   ApiProvider.npp = user;
                                          // },
                                          decoration: InputDecoration(
                                              errorText: _validate
                                                  ? "Masukan NPP anda"
                                                  : null,
                                              border: InputBorder.none,
                                              hintText: "Masukan NIK",
                                              hintStyle: GoogleFonts.poppins(color: Color(0xFFBDBDBD)),
                                              icon: const Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 3.0),
                                                  child: const Icon(
                                                    Icons.account_box_outlined, color: PalettesColor.redtelkomsel,))),
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
                                          ///controller: etNpp,
                                          keyboardType: TextInputType.number,
                                          // onChanged: (String user) {
                                          //   ApiProvider.npp = user;
                                          // },
                                          decoration: InputDecoration(
                                              errorText: _validate
                                                  ? "Masukan NPP anda"
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

                                      //input Alamat
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[100]))),
                                        child: TextFormField(
                                          ///controller: etNpp,
                                          keyboardType: TextInputType.text,
                                          // onChanged: (String user) {
                                          //   ApiProvider.npp = user;
                                          // },
                                          decoration: InputDecoration(
                                              errorText: _validate
                                                  ? "Masukan NPP anda"
                                                  : null,
                                              border: InputBorder.none,
                                              hintText: "Masukan Alamat",
                                              hintStyle: GoogleFonts.poppins(color: Color(0xFFBDBDBD)),
                                              icon: const Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 3.0),
                                                  child: const Icon(
                                                    Icons.place_outlined, color: PalettesColor.redtelkomsel,))),
                                        ),
                                      ),
                                      //input Kode Pos
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[100]))),
                                        child: TextFormField(
                                          ///controller: etNpp,
                                          keyboardType: TextInputType.number,
                                          // onChanged: (String user) {
                                          //   ApiProvider.npp = user;
                                          // },
                                          decoration: InputDecoration(
                                              errorText: _validate
                                                  ? "Masukan NPP anda"
                                                  : null,
                                              border: InputBorder.none,
                                              hintText: "Masukan Kode Pos",
                                              hintStyle: GoogleFonts.poppins(color: Color(0xFFBDBDBD)),
                                              icon: const Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 3.0),
                                                  child: const Icon(
                                                    Icons.place_outlined, color: PalettesColor.redtelkomsel,))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30,),
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
                                              etNpp.text.isEmpty
                                                  ? _validate = true
                                                  : _validate = false;
                                              etPassword.text.isEmpty
                                                  ? _validate = true
                                                  : _validate = false;
                                              if (etNpp.text.isNotEmpty &&
                                                  etPassword.text.isNotEmpty) {
                                                // ShowDialogLogin();
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

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

