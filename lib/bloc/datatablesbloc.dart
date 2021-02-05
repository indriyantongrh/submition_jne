
import 'package:bms_mobile/model/modeltables.dart';
import 'package:bms_mobile/resource/repository.dart';
import 'package:rxdart/rxdart.dart';

class DataTablesBloc{
  final _repository = Repository();
  final _DataObject = PublishSubject<List<Modeltables>>();

  Observable<List<Modeltables>> get dataObject => _DataObject.stream;
  fetchdataTabelss() async {
    List<Modeltables> dataTables = await _repository.fetctdataTables();
    _DataObject.sink.add(dataTables);
  }
  dispose(){
    _DataObject.close();
  }
}

final bloc = DataTablesBloc();