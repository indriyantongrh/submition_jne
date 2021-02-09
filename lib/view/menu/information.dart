import 'package:flutter/material.dart';

class Belanja extends StatefulWidget {
  @override
  _BelanjaState createState() => _BelanjaState();
}

class _BelanjaState extends State<Belanja> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informasi"),
        centerTitle: true,
        leading: Container(),
      ),
      body: Container(
        child: Center(
          child: Text("Blank Page"),
        ),
      ),
    );
  }
}
