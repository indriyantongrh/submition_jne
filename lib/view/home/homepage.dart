import 'dart:io';


import 'package:bms_mobile/view/menu/datatabel.dart';
import 'package:bms_mobile/view/widget/widgets.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController(initialPage: 0, viewportFraction: 0.8);
  String hari ;
  String pagi ="pagi";
  String siang ="siang";
  String sore ="sore";
  String malam ="malam";


  List<Widget> travels = [
    Informationbox(
      urlImage:
      "https://akcdn.detik.net.id/community/media/visual/2021/01/13/presiden-jokowi-setelah-disuntik-vaksin-corona-5_43.jpeg?w=700&q=90",
      title: "Ada 30 Ribu Vaksinator, Jokowi Targetkan Vaksinasi COVID Rampung Setahun",
    ),
    Informationbox(
      urlImage:
      "https://akcdn.detik.net.id/community/media/visual/2021/01/24/bakamla-amankan-2-kapal-tanker-asing-di-perairan-pontianak_169.jpeg?w=700&q=90",
      title: "Bakamla Amankan 2 Kapal Tanker Asing di Perairan Pontianak",
    ),
    Informationbox(
      urlImage:
      "https://akcdn.detik.net.id/community/media/visual/2020/11/14/gubernur-bali-i-wayan-koster-1_43.jpeg?w=700&q=90",
      title: "Viral Acara PDIP Bali Tiup Lilin Buka Masker dan Suap-suapan Satu Sendok",
    ),
  ];



  @override
  List<Widget> informasiupdate = [
    UpToDateCard(Colors.orangebni, Colors.orangebni,
        "assets/dataanalis.png", "Bank BNI lagi promo nih!",
        "Bisa pake transfer"),
    UpToDateCard(Colors.orangebni, Colors.orangebni,
        "assets/checklist.png", "Bank BNI lagi promo nih!",
        "Bisa pake transfer"),

  ];


  @override
  void initState() {
 
    super.initState();
  }



  Widget build(BuildContext context) {
    var now = DateTime.now().hour;
    if (now < 10) {
      hari = pagi;
      print("pagi");
    } else if (now < 15) {
      hari = siang;
      print("siang");
    } else if (now < 18){
      hari =sore;
      print("sore");
    }else {
      hari =malam;
      print("malem");
    }

    return Scaffold(
      body: Container(
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
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat $hari",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: "airbnb",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    "INDRIYANTO NUGROHO",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "airbnb"),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child:
                SingleChildScrollView(

                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 140,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                )),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 20,
                                ),
                                new CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.redtelkomsel,
                                  child: CircleAvatar(
                                    radius: 36,
                                    backgroundColor: Colors.white70,
                                    backgroundImage: AssetImage("assets/peson.png"),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 30,
                                        ),
                                        LimitedBox(
                                          maxWidth: 250,
                                          child:   Text(
                                            "INDRIYANTO NUGROHO",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'AirBnb'),
                                          ),
                                        ),

                                        Text(
                                          "Mobile Developers",
                                          style: TextStyle(
                                              fontSize: 16, fontFamily: 'AirBnb'),
                                        ),
                                        Text(
                                          "indriyantongrh@bni.co.id",
                                          style: TextStyle(
                                              fontSize: 16, fontFamily: 'AirBnb'),
                                        )
                                      ]),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,

                          ),


                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child:
                                  Row(
                                  children: [
                                    Image(
                                      image: AssetImage('assets/menu.png'),
                                      height: 14,
                                      width: 14,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Kategori Menu",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'AirBnB',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                  ),
                                ),
                                Container(
                                  height: 250.0,
                                  child: GridView(
                                    gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 3 / 2),
                                    children: [
                                      _gridItem("assets/dataanalis.png", "Data Table"),
                                      _gridItem("assets/checklist.png", "Menu 2"),
                                      _gridItem("assets/archive.png", "Menu 3"),
                                      _gridItem("assets/dossier.png", "Menu 4"),
                                      _gridItem("assets/laporan_diri.png", "Menu 5"),
                                      _gridItem("assets/analytics.png", "Menu 6"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child:
                                  Row(
                                    children: [
                                      Image(
                                        image: AssetImage('assets/announce.png'),
                                        height: 15,
                                        width: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Informasi Terkini",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'AirBnB',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )

                                ),

                                Container(
                                  height: 180,
                                  width: double.infinity,

                                  child: PageView.builder(
                                      controller: controller,
                                      itemCount: travels.length,
                                      itemBuilder: (context, index) =>
                                          Container(
                                            ///margin: (left),
                                            child: travels[index],
                                          )),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_gridItem(String image, String name,) {
  return Column(
    children: [

      SizedBox(
        width: 50,
        height: 50,
        child: Image.asset(image),
      ),
      SizedBox(
        height: 10,
      ),
      Text(name)
    ],
  );
}

class builderMenu extends StatelessWidget {
  const builderMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: Image.asset("assets/dataanalis.png"),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Menu 1",
            style: TextStyle(
              fontFamily: 'AirBnB',
            ),
          ),
        ],
      ),
    );
  }
}


