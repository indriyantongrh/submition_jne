
import 'package:bms_mobile/model/model.dart';
import 'package:bms_mobile/model/modeldetail.dart';
import 'package:bms_mobile/model/modellogin.dart';
import 'package:bms_mobile/model/modeltables.dart';
import 'package:bms_mobile/model/modeluser.dart';
import 'package:bms_mobile/resource/repository.dart';
import 'package:rxdart/rxdart.dart';

class detailUserbloc{
  final _repository = Repository();
  final _userObject = PublishSubject <List<Modeldetail>>();

  Observable <List<Modeldetail>> get dataObjectLogin => _userObject.stream;
  fetchdataDetail() async {
    List<Modeldetail> detailRes = await _repository.fetctuserDetail();
    _userObject.sink.add(detailRes);
  }
  dispose(){
    _userObject.close();
  }
}
final blocDetail = detailUserbloc();