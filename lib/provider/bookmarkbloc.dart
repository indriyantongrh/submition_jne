import 'package:bms_mobile/datamenu/modelmenu.dart';
import 'package:flutter/cupertino.dart';

class BookmarkBloc extends ChangeNotifier {
  int _count = 0;
  int _maxcount = 8;
  List<Modelmenu> items = [];

  void addCount() {
    _count++;
    notifyListeners();
  }

  void addItems(Modelmenu data) {
    items.add(data);
    notifyListeners();
  }

  int get count {
    return _count;
  }

  List<Modelmenu> get itemsList {
    return items;
  }
}
