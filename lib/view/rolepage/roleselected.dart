
import 'package:bms_mobile/menuutama.dart';
import 'package:bms_mobile/view/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class RoleSelected extends StatefulWidget {
  @override
  _RoleSelectedState createState() => _RoleSelectedState();
}

class _RoleSelectedState extends State<RoleSelected> {
  bool _enabled = true;

  // backing data
  final europeanCountries = [
    'Admin Unit - Kelompok Pantest 1',
    'Member Unit - Kelompok OFA',
    'Member Unit - Kelompok Pantes1',
    'Pemimpin Divisi - Divisi OFA',
    'Pemimpin Unit - Kelompok Pantes 1',
    'Sekretaris Divisi - Divisi OFA',
    'Sekretaris Wakil - Wakil OFA - DGM1',
    'Wakil Divisi - Wakil OFA - DGM 1'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Peran"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey,
          );
        },
        itemBuilder: (context, index) {
          return
              GestureDetector(
                onTap:(){
                  setState(() {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => MenuUtama()));
                  });
                },
                child:
                Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 20.0, right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new CircleAvatar(
                          backgroundImage: AssetImage("assets/icon_person.png"),
                          backgroundColor: Colors.white70,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          europeanCountries[index],
                          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              );

        },
        itemCount: europeanCountries.length,
      ),
    );
  }
}
