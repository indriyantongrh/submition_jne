
import 'package:bms_mobile/model/model.dart';
import 'package:bms_mobile/model/modelabsendetail.dart';
import 'package:bms_mobile/model/modeldetail.dart';
import 'package:bms_mobile/model/modellogin.dart';
import 'package:bms_mobile/model/modeltables.dart';
import 'package:bms_mobile/model/modeluser.dart';
import 'package:bms_mobile/resource/repository.dart';
import 'package:rxdart/rxdart.dart';

class detailabsenbloc{
  final _repository = Repository();
  final _userObject = PublishSubject <List<Modelabsendetail>>();

  Observable <List<Modelabsendetail>> get dataObjectLogin => _userObject.stream;
  fetchdetailAbsen() async {
    List<Modelabsendetail> absenRes = await _repository.fetchdetailAbsen();
    _userObject.sink.add(absenRes);
  }
  dispose(){
    _userObject.close();
  }
}
final blocAbsen = detailabsenbloc();