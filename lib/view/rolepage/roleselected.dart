import 'package:flutter/material.dart';
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
               Card(
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
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
        },
        itemCount: europeanCountries.length,
      ),
    );
  }
}
