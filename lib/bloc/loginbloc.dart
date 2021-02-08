
import 'package:bms_mobile/model/modellogin.dart';
import 'package:bms_mobile/model/modeltables.dart';
import 'package:bms_mobile/model/modeluser.dart';
import 'package:bms_mobile/resource/repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc{
  final _repository = Repository();
  final _userObject = PublishSubject <Modellogin>();

  Observable <Modellogin> get dataObjectLogin => _userObject.stream;
  fetchdataLogins() async {
    Modellogin LoginRes = await _repository.fetctuserLogin();
    _userObject.sink.add(LoginRes);
  }
  dispose(){
    _userObject.close();
  }
}

final bloc = LoginBloc();