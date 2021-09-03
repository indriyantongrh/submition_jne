
import 'package:bms_mobile/model/model.dart';
import 'package:bms_mobile/model/modelabsendetail.dart';
import 'package:bms_mobile/model/modeldetail.dart';
import 'package:bms_mobile/model/modeldetailreport.dart';
import 'package:bms_mobile/model/modellogin.dart';
import 'package:bms_mobile/model/modeltables.dart';
import 'package:bms_mobile/model/modeluser.dart';
import 'package:bms_mobile/resource/repository.dart';
import 'package:rxdart/rxdart.dart';

class detailreportbloc{
  final _repository = Repository();
  final _userObject = PublishSubject <List<Modeldetailreport>>();

  Observable <List<Modeldetailreport>> get dataObjectLogin => _userObject.stream;
  fetchdetailReportn() async {
    List<Modeldetailreport> absenRes = await _repository.fetchdetailReportn();
    _userObject.sink.add(absenRes);
  }
  dispose(){
    _userObject.close();
  }
}
final blocDetailReport = detailreportbloc();