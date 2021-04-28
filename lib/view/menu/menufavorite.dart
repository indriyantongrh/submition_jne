
import 'package:bms_mobile/datamenu/modelmenu.dart';
import 'package:bms_mobile/palettescolor/palettescolor.dart';
import 'package:bms_mobile/provider/bookmarkbloc.dart';
import 'package:bms_mobile/view/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
///ChangeNotifierProvider(create: (context) => BookmarkBloc(), child: MenuFavorites(),)


class MenuFavorite extends StatefulWidget {

  @override
  _MenuFavoriteState createState() =>  _MenuFavoriteState();
}

class _MenuFavoriteState extends State<MenuFavorite> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Favorite"),
          centerTitle: true,
        ),
        body:  Container(

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
                    new Container(
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
                                            //Icon Binatng Favorite
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                Stack(
                                                  children: [
                                                    IconButton(
                                                        icon:
                                                        Icon(Icons.star_border),
                                                        onPressed: () {

                                                        })
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ));
                                  });
                            }
                          },
                        )),
                    Row(
                      children: [
                        Text(
                          "Menu Kategori",
                          style: GoogleFonts.poppins(fontSize: 20),
                        ),
                        Spacer(),

                      ],
                    ),
                    new Container(
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
                                            //Icon Binatng Favorite
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                Stack(
                                                  children: [
                                                    IconButton(
                                                        icon:
                                                        Icon(Icons.star_border),
                                                        onPressed: () {

                                                        })
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ));
                                  });
                            }
                          },
                        )),
                  ],
                ),
              )),
        )
    );
  }
}


