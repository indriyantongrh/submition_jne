import 'package:bms_mobile/datamenu/dao/FavoriteDAO.dart';
import 'package:bms_mobile/datamenu/favorite.dart';
import 'package:floor/floor.dart';

import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'database.g.dart';

@Database(version:1 , entities:[Favorite])
abstract class AppDatabase extends FloorDatabase{
  FavoriteDAO get favoriteDao;
}