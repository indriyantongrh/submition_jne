
import 'package:floor/floor.dart';

@entity
class Favorite{
  @primaryKey
  final int id;
  final String uid,name,image;

  Favorite({this.id, this.uid, this.name, this.image});
}