
import 'package:bms_mobile/model/modeltables.dart';
import 'package:bms_mobile/model/modeluser.dart';
import 'package:bms_mobile/resource/repository.dart';
import 'package:rxdart/rxdart.dart';

class DataUserBloc{
  final _repository = Repository();
  final _userObject = PublishSubject<List<Modeluser>>();

  Observable<List<Modeluser>> get dataObject => _userObject.stream;
  fetchdataUsers() async {
    List<Modeluser> dataUsers = await _repository.fetctdataUser();
    _userObject.sink.add(dataUsers);
  }
  dispose(){
    _userObject.close();
  }
}

final bloc = DataUserBloc();