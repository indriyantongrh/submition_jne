import 'package:bms_mobile/resource/apiprovider.dart';
import 'package:bms_mobile/view/loginpage/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  static GlobalKey<ScaffoldState> scaffold_state =  new GlobalKey<ScaffoldState>();

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffold_state,
      body: Container(
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
                  Center(
                    child: Text(
                        ApiProvider.name,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500)
                    ),
                  ),
                  Center(
                    child: Text(
                        ApiProvider.email,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 14)
                    ),
                  ),

                  Divider(color: Colors.grey[300], thickness: 7,height: 60,),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: GestureDetector(
                          onTap: (){
                            ClickMenu();
                          },
                          child: Text(
                              "Menu Option 1",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontSize:16,fontWeight: FontWeight.w500 )
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(right: 15),
                          alignment: Alignment.centerRight,
                          child: Align(
                              alignment: Alignment.centerRight,
                              child:  Icon(Icons.arrow_forward_ios,)
                          )
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey, height:40, indent: 20,),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: GestureDetector(
                          onTap: (){
                            ClickMenu();

                          },
                          child: Text(
                              "Menu Option 2",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontSize:16 ,fontWeight: FontWeight.w500)
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(right: 15),
                          alignment: Alignment.centerRight,
                          child: Align(
                              alignment: Alignment.centerRight,
                              child:  Icon(Icons.arrow_forward_ios,)
                          )
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey, height:40, indent: 20,),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: GestureDetector(
                          onTap: (){
                            ClickMenu();

                          },
                          child: Text(
                              "Menu Option 3",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontSize:16, fontWeight: FontWeight.w500 )
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(right: 15),
                          alignment: Alignment.centerRight,
                          child: Align(
                              alignment: Alignment.centerRight,
                              child:  Icon(Icons.arrow_forward_ios,)
                          )
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey[300], thickness: 7,height: 60,),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: GestureDetector(
                          onTap: (){
                            ClickMenu();

                          },
                          child: Text(
                              "Menu Option 4",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontSize:16,fontWeight: FontWeight.w500 )
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(right: 15),
                          alignment: Alignment.centerRight,
                          child: Align(
                              alignment: Alignment.centerRight,
                              child:  Icon(Icons.arrow_forward_ios,)
                          )
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey, height:40, indent: 20,),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: GestureDetector(
                          onTap: (){
                            ClickMenu();

                          },
                          child: Text(
                              "Menu Option 5",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontSize:16 , fontWeight: FontWeight.w500)
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(right: 15),
                          alignment: Alignment.centerRight,
                          child: Align(
                              alignment: Alignment.centerRight,
                              child:  Icon(Icons.arrow_forward_ios,)
                          )
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey[300], thickness: 7,height: 60,),

                  Center(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushReplacement(new MaterialPageRoute(
                              builder: (BuildContext context) => Login()));
                        },
                        child: Text(
                          "Logout",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(fontSize: 20, color: Color(0xFFE4141D), fontWeight: FontWeight.w600)
                        ),
                      )
                  ),
                ],
              )

            ],
          ),
        )



      )
    );
  }
}

