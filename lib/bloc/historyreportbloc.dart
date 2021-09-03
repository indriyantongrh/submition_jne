
import 'package:bms_mobile/model/modelhistoryabsensi.dart';
import 'package:bms_mobile/model/modelhistoryreport.dart';
import 'package:bms_mobile/resource/repository.dart';
import 'package:rxdart/rxdart.dart';

class historyreportbloc{
  final _repository = Repository();
  final _DataObject = PublishSubject<List<Modelhitoryreport>>();

  Observable<List<Modelhitoryreport>> get dataObject => _DataObject.stream;
  // fetchHistoryReport() async {
  //   List<Modelhitoryreport> dataTableses = await _repository.fetchHistoryreport();
  //   _DataObject.sink.add(dataTableses);
  // }
  dispose(){
    _DataObject.close();
  }
}

final blocHistoryreport = historyreportbloc();