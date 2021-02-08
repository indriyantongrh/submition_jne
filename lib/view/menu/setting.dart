import 'package:bms_mobile/resource/apiprovider.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        centerTitle: true,
        leading: new Container(),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              height: height,
            ),
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
            Column(
              children: [
                SizedBox(
                  height: height * 0.32,
                ),
                Center(
                  child: Text(
                    ApiProvider.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'AirBnB',
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    ApiProvider.jabatan,
                    textAlign: TextAlign.center,
                    style: TextStyle(

                      fontSize: 14,
                      fontFamily: 'AirBnB',
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    ApiProvider.email,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'AirBnB',
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Center(
                  child: Text(
                    "Logout",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'AirBnB',
                    ),
                  ),
                ),

              ],
            )


          ],
        ),
      )
    );
  }
}
