import 'dart:convert';
import 'dart:io';
import 'package:bms_mobile/view/absensi/absensi.dart';
import 'package:bms_mobile/view/dailyreport/dailyreport.dart';
import 'package:bms_mobile/view/dailyreport/historydaily.dart';
import 'package:bms_mobile/view/historyabsensi/datatabel.dart';
import 'package:bms_mobile/view/menu/menufavorite.dart';
import 'package:bms_mobile/view/monitoringabsensi/monitoringabsensi.dart';
import 'package:bms_mobile/view/monitoringdailyreport/monitoringdailyreport.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:bms_mobile/datamenu/const/const.dart';
import 'package:bms_mobile/datamenu/dao/FavoriteDAO.dart';
import 'package:bms_mobile/datamenu/database/database.dart';
import 'package:bms_mobile/datamenu/datamenu.dart';
import 'package:bms_mobile/datamenu/datamenu.dart';
import 'package:bms_mobile/datamenu/favorite.dart';
import 'package:bms_mobile/datamenu/modelmenu.dart';
import 'package:bms_mobile/model/menumodel.dart';
import 'package:bms_mobile/palettescolor/palettescolor.dart';
import 'package:bms_mobile/resource/apiprovider.dart';
import 'package:bms_mobile/view/menu/datatabel.dart';
import 'package:bms_mobile/view/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:bms_mobile/bloc/dataUserBloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:bms_mobile/provider/bookmarkbloc.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAppDatabase.databaseBuilder('edmt_favorites.db').build();
  final dao = database.favoriteDao;
  runApp(new MyApp(dao: dao));
}

class MyApp extends StatelessWidget {
  final FavoriteDAO dao;

  MyApp({this.dao});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(dao: dao),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.dao});

  final FavoriteDAO dao;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller =
      PageController(initialPage: 0, viewportFraction: 0.8);
  String hari;

  String pagi = "pagi";
  String siang = "siang";
  String sore = "sore";
  String malam = "malam";
  String dataLevel;
  bool visibilityTag = false;
  bool _toggleState = false;

  List<menuData> _menuServiceList = [];
  final Set<menuData> _saved = new Set<menuData>();
  String Idss;
  String idUsers="";
  void getValue() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      idUsers = pref.getString("idUsers");

    });

    // final SharedPreferences pref = await SharedPreferences.getInstance();
    // var ids = pref.getString('idUsers');
    // setState(() {
    //   Idss=ids;
    // });
    // print("Id shared : "+Idss);
  }

  @override
  void initState() {

   getValue();
    super.initState();
  }

  List<Widget> travels = [
    Informationbox(
      urlImage:
          "https://akcdn.detik.net.id/community/media/visual/2021/01/13/presiden-jokowi-setelah-disuntik-vaksin-corona-5_43.jpeg?w=700&q=90",
      title:
          "Ada 30 Ribu Vaksinator, Jokowi Targetkan Vaksinasi COVID Rampung Setahun",
    ),
    Informationbox(
      urlImage:
          "https://akcdn.detik.net.id/community/media/visual/2021/01/24/bakamla-amankan-2-kapal-tanker-asing-di-perairan-pontianak_169.jpeg?w=700&q=90",
      title: "Bakamla Amankan 2 Kapal Tanker Asing di Perairan Pontianak",
    ),
    Informationbox(
      urlImage:
          "https://akcdn.detik.net.id/community/media/visual/2020/11/14/gubernur-bali-i-wayan-koster-1_43.jpeg?w=700&q=90",
      title:
          "Viral Acara PDIP Bali Tiup Lilin Buka Masker dan Suap-suapan Satu Sendok",
    ),
  ];

  @override
  List<Widget> informasiupdate = [
    UpToDateCard(Colors.orangebni, Colors.orangebni, "assets/dataanalis.png",
        "Bank BNI lagi promo nih!", "Bisa pake transfer"),
    UpToDateCard(Colors.orangebni, Colors.orangebni, "assets/checklist.png",
        "Bank BNI lagi promo nih!", "Bisa pake transfer"),
  ];

  Widget build(BuildContext context) {

    var now = DateTime.now().hour;
    if (now < 10) {
      hari = pagi;
      print("pagi");
    } else if (now < 15) {
      hari = siang;
      print("siang");
    } else if (now < 18) {
      hari = sore;
      print("sore");
    } else {
      hari = malam;
      print("malem");
    }

    if(ApiProvider.level == "1"){
      dataLevel = "Manajer";
      visibilityTag = true;
        print(ApiProvider.level);
    }else{
      dataLevel = "Pegawai";
      visibilityTag = false;
      print(ApiProvider.level);
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
                  Text("Selamat $hari",
                      style: GoogleFonts.poppins(
                          fontSize: 30,
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w200)),
                  SizedBox(
                    height: 5,
                  ),
                  Text(ApiProvider.namalengkap,
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w300)),
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
                  child: SingleChildScrollView(
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
                                      backgroundImage:
                                          AssetImage("assets/peson.png"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 30,
                                          ),
                                          LimitedBox(
                                            maxWidth: 250,
                                            child: Text(ApiProvider.namalengkap,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),

                                          Text(ApiProvider.email,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300)),

                                          Container(
                                            height: 40,
                                            width: 130,
                                            child:    Card(
                                              color: Colors.amberAccent,
                                              child: Center(
                                                child:  Text(dataLevel,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w700)),
                                              )

                                            ),
                                          )

                                        ]),
                                  ),

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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: [
                                        Image(
                                          image: AssetImage('assets/menu.png'),
                                          height: 14,
                                          width: 14,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text("Menu",
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  absensi()));
                                        },
                                        child: HeaderItem(
                                          id: 1,
                                          images: 'assets/icon/balancesheet.png',
                                          title: 'Absensi',
                                          textcolor: Colors.grey[600],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  dailyreport()));
                                        },
                                        child: HeaderItem(
                                          id: 2,
                                          images: 'assets/icon/decrease.png',
                                          title: 'Daily Report',
                                          textcolor: Colors.grey[600],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  DataTables()));
                                        },
                                        child: HeaderItem(
                                          id: 3,
                                          images: 'assets/icon/growth.png',
                                          title: 'History Absensi',
                                          textcolor: Colors.grey[600],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  historydaily()));

                                        },
                                        child: HeaderItem(
                                          id: 3,
                                          images: 'assets/icon/growth.png',
                                          title: 'History daily report',
                                          textcolor: Colors.grey[600],
                                        ),
                                      ),


                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Visibility(
                                        visible: visibilityTag,
                                        child:  InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  monitoringdailyreport()));

                                        },
                                        child: HeaderItem(
                                          id: 5,
                                          images: 'assets/icon/card.png',
                                          title: 'Monitoring Daily Report',
                                          textcolor: Colors.grey[600],
                                        ),
                                      ),
                                      ),

                                      Visibility(
                                        visible: visibilityTag,
                                        child:
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  monitoringabsensi()));

                                          },
                                          child: HeaderItem(
                                            id: 4,
                                            images: 'assets/icon/piechart.png',
                                            title: 'Monitoring Absensi',
                                            textcolor: Colors.grey[600],
                                          ),
                                        ),),
                                      InkWell(
                                        onTap: () {},
                                        child: HeaderItem(
                                          images: '',
                                          title: '',
                                          textcolor: Colors.grey[600],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _showBottomsheetMenu(context);
                                        },
                                        child: HeaderItem(
                                          images: '',
                                          title: '',
                                          textcolor: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )

                                  // Container(
                                  //   height: 250.0,
                                  //   child: GridView(
                                  //     gridDelegate:
                                  //     SliverGridDelegateWithFixedCrossAxisCount(
                                  //         crossAxisCount: 3,
                                  //         childAspectRatio: 3 / 2),
                                  //     children: [
                                  //       _gridItem("assets/dataanalis.png", "Menu 1"),
                                  //       _gridItem("assets/checklist.png", "Menu 2"),
                                  //       _gridItem("assets/archive.png", "Menu 3"),
                                  //       _gridItem("assets/dossier.png", "Menu 4"),
                                  //       _gridItem("assets/laporan_diri.png", "Menu 5"),
                                  //       _gridItem("assets/analytics.png", "Menu 6"),
                                  //     ],
                                  //   ),
                                  // )
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Row(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                'assets/announce.png'),
                                            height: 15,
                                            width: 15,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("Informasi Terkini",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      )),
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
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showBottomsheetMenu(context) {

    showMaterialModalBottomSheet(
        context: context,
        builder: (BuildContext) {
          return Container(
            height: MediaQuery.of(context).size.height * .60,
            child: Padding(
                padding: EdgeInsets.only(left: 5, top: 5),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Menu Favorite",
                            style: GoogleFonts.poppins(fontSize: 20),
                          ),
                          Spacer(),

                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Menu Kategori",
                            style: GoogleFonts.poppins(fontSize: 20),
                          ),
                          Spacer(),
                          GestureDetector(
                            child:
                            OutlineButton(
                              color: PalettesColor.redtelkomsel,
                              onPressed: (){Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => MenuFavorite()));},
                              child: new Text(
                                "EDIT FAVORITES",
                                style:
                                new TextStyle(fontSize: 12.0, color: PalettesColor.redtelkomsel),
                              ),
                            )
                          )
                        ],
                      ),
                      new
                      Container(
                          height: 350.0,
                          child: FutureBuilder<List<Modelmenu>>(
                            future: readJson(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError)
                                return Center(
                                  child: Text('${snapshot.error}'),
                                );
                              else if (snapshot.hasData) {
                                var items = snapshot.data as List<Modelmenu>;
                                return GridView.builder(
                                    physics: new NeverScrollableScrollPhysics(),
                                    itemCount: items == null ? 0 : items.length,
                                    gridDelegate:
                                        new SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4),
                                    itemBuilder: (context, index) {
                                      return Container(
                                          width: 80,
                                          height: 80,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  Image.asset(
                                                    items[index].image,
                                                    scale: 10,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    items[index].name,
                                                  ),
                                                ],
                                              ),
                                              // //Icon Binatng Favorite
                                              // Row(
                                              //   mainAxisAlignment:
                                              //       MainAxisAlignment.end,
                                              //   children: [
                                              //     Stack(
                                              //       children: [
                                              //         IconButton(icon: Icon(Icons.star_border),
                                              //             onPressed: (){
                                              //
                                              //             })
                                              //
                                              //       ],
                                              //     ),
                                              //   ],
                                              // )
                                            ],
                                          ));
                                    });
                              }
                            },
                          )
                          ),
                    ],
                  ),
                )),
          );
        });
  }

  Widget _rowMenuServices(Modelmenu modelMenu) {
    return new Container(
      height: double.infinity,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                showModalBottomSheet<void>(builder: (context) {
                  return _showBottomsheetMenu(context);
                });
              },
              child: InkWell(
                onTap: () {
                  setState(() {
                    //MasukanFav(modelMenu);
                    //print("Kliked");
                  });
                },
                child: HeaderItem(
                  images: modelMenu.image,
                  title: modelMenu.name,
                  textcolor: Colors.grey[600],
                ),
              )),
        ],
      ),
    );
  }



  // untuk menambah favorite ke database
  void MasukanFav(Modelmenu modelmenu) async {
    FutureBuilder(
        future: checkFav(modelmenu),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: null,
            );
          else
            return IconButton(
                icon: Icon(Icons.favorite_border), onPressed: null);
        });
  }

  Future<Favorite> checkFav(Modelmenu item) async {
    return await widget.dao.getFavInFavByUid(UID, item.id);
  }

  Future<Favorite> checkFavo(Modelmenu item) async {
    return await widget.dao.getFavInFavByUid(UID, item.id);
  }
}

// Untuk memanggil Json Local
Future<List<Modelmenu>> readJson() async {
  final rowData =
      await rootBundle.rootBundle.loadString('load_json/load_menu.json');
  final list = json.decode(rowData) as List<dynamic>;
  return list.map((e) => Modelmenu.fromJson(e)).toList();
}

////  untuk Menampikan icon dan nama icon
class HeaderItem extends StatelessWidget {
  const HeaderItem({Key key, this.images, this.title, this.textcolor, this.dao, this.id})
      : super(key: key);
  final String images;
  final String title;
  final Color textcolor;
  final int id;

  final FavoriteDAO dao;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  images,
                  scale: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textcolor ?? Colors.white),
                ),
              ],
            ),
            //Icon Binatng Favorite

          ],
        ));
  }
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
