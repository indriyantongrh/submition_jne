
import 'package:bms_mobile/model/modelhistoryabsensi.dart';
import 'package:bms_mobile/resource/repository.dart';
import 'package:rxdart/rxdart.dart';

class historyabsensibloc{
  final _repository = Repository();
  final _DataObject = PublishSubject<List<Modelhitoryabsensi>>();

  Observable<List<Modelhitoryabsensi>> get dataObject => _DataObject.stream;
  fetchHistoryabsensi() async {
    List<Modelhitoryabsensi> dataTableses = await _repository.fetchHistoryabsensi();
    _DataObject.sink.add(dataTableses);
  }
  dispose(){
    _DataObject.close();
  }
}

final blocHistory = historyabsensibloc();