import 'dart:async';
import 'package:flutter/widgets.dart';

class menuData {
  int id;
  String name;
  String image;
  bool favorit;

  menuData({this.id, this.name, this.image, this.favorit});

  Future <List<menuData>> fetchMenu() async{
    List<menuData> _menuServiceList = [];
    _menuServiceList.add(new menuData(
        id: 1, name: 'menu 1', image: 'assets/icon/balancesheet.png', favorit: false
    ));
    _menuServiceList.add(new menuData(
        id: 2, name: 'menu 2', image: 'assets/icon/card.png', favorit: false
    ));
    _menuServiceList.add(new menuData(
        id: 3, name: 'menu 3', image: 'assets/icon/decrease.png', favorit: false
    ));
    _menuServiceList.add(new menuData(
        id: 5, name: 'menu 4', image: 'assets/icon/growth.png', favorit: false
    ));
    _menuServiceList.add(new menuData(
        id: 5, name: 'menu 5', image: 'assets/icon/growth.png', favorit: false
    ));
    _menuServiceList.add(new menuData(
        id: 6, name: 'menu 6', image: 'assets/icon/officesupplies.png', favorit: false
    ));
    _menuServiceList.add(new menuData(
        id: 7, name: 'menu 7', image: 'assets/icon/piechart.png', favorit: false
    ));
    _menuServiceList.add(new menuData(
        id: 8, name: 'menu 8', image: 'assets/icon/sharemoney.png', favorit: false
    ));
    _menuServiceList.add(new menuData(
        id: 9, name: 'menu 9', image: 'assets/icon/speechbubble.png', favorit: false
    ));
    _menuServiceList.add(new menuData(
        id: 10, name: 'menu 10', image: 'assets/icon/grid.png', favorit: true
    ));

  }


  //
  //  List<menuData> menu  = [
  //   menuData(id: 1, name: 'menu 1', image: 'assets/icon/balancesheet.png', favorit: false),
  //   menuData(id: 2, name: 'menu 2', image: 'assets/icon/card.png', favorit: false),
  //   menuData(id: 3, name: 'menu 3', image: 'assets/icon/decrease.png', favorit: false),
  //   menuData(id: 4, name: 'menu 4', image: 'assets/icon/grid.png', favorit: false),
  //   menuData(id: 5, name: 'menu 5', image: 'assets/icon/growth.png', favorit: true),
  //   menuData(id: 6, name: 'menu 6', image: 'assets/icon/officesupplies.png', favorit: false),
  //   menuData(id: 7, name: 'menu 7', image: 'assets/icon/piechart.png', favorit: false),
  //   menuData(id: 8, name: 'menu 8', image: 'assets/icon/sharemoney.png', favorit: false),
  //   menuData(id: 9, name: 'menu 9', image: 'assets/icon/speechbubble.png', favorit: false),
  //   menuData(id: 10, name: 'menu 10', image: 'assets/icon/ipload.png', favorit: false),
  //
  // ];
}


