import 'dart:async';

import 'package:bms_mobile/view/loginpage/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startSplashScreen();

  }

  startSplashScreen() async {

    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return Login();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 90.0,
                          child: Image.asset("assets/logosp.png",
                            height: 300,
                            width: 350,)
                      ),
                      CircularProgressIndicator(
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
                        strokeWidth: 2,
                      ),
                      /*Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),*/

                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),

    );
  }
}
