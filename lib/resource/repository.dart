
import 'package:bms_mobile/model/modellogin.dart';
import 'package:bms_mobile/model/modeltables.dart';
import 'package:bms_mobile/model/modeluser.dart';
import 'package:bms_mobile/resource/apiprovider.dart';

class Repository{
  final apiProvider = ApiProvider();

  //untuk ambil data tabel
  Future <List<Modeltables>> fetctdataTables() => apiProvider.fetchDataTables();

  //untuk ambil data user
  Future <List<Modeluser>> fetctdataUser() => apiProvider.fetchDataUser();

  //untuk ambil data user
  Future <Modellogin> fetctuserLogin() => apiProvider.fetchDataLogin();

}