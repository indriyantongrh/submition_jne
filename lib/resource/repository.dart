
import 'package:bms_mobile/model/model.dart';
import 'package:bms_mobile/model/modelabsendetail.dart';
import 'package:bms_mobile/model/modeldetail.dart';
import 'package:bms_mobile/model/modeldetailreport.dart';
import 'package:bms_mobile/model/modelhistoryabsensi.dart';
import 'package:bms_mobile/model/modelhistoryreport.dart';
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

  //untuk ambil data user
  Future <List<Modeldetail>> fetctuserDetail() => apiProvider.fetchuserDetail();

  //untuk ambil data detail absen
  Future <List<Modelabsendetail>> fetchdetailAbsen() => apiProvider.fetchabsenDetail();

  // //untuk ambil data detail absen
  // Future <List<Modelhitoryabsensi>> fetchHistoryabsensi() => apiProvider.fetchHistoryAbsen();

  // //untuk ambil data detail report
  // Future <List<Modelhitoryreport>> fetchHistoryreport() => apiProvider.fetchHistoryReport();

  //untuk ambil data detail report
  Future <List<Modeldetailreport>> fetchdetailReportn() => apiProvider.fetchDetailReport();

}