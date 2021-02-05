
import 'package:bms_mobile/model/modeltables.dart';
import 'package:bms_mobile/resource/apiprovider.dart';

class Repository{
  final apiProvider = ApiProvider();

  //untuk ambil data Role Peran
  Future <List<Modeltables>> fetctdataTables() => apiProvider.fetchDataTables();

}