
import 'package:bms_mobile/bloc/loginbloc.dart';
import 'package:bms_mobile/resource/apiprovider.dart';
import 'package:bms_mobile/view/rolepage/roleselected.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //untuk memunculkan text input klarasi
  TextEditingController etNpp = new TextEditingController();
  TextEditingController etPassword = new TextEditingController();

  // Initially password is obscure
  bool _obscureText = true;
  String _password;
  bool _validate;

  static GlobalKey<ScaffoldState> scaffold_state =
  new GlobalKey<ScaffoldState>();

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    _validate = false;
    ///bloc.fetchdataLogins();
    ///ApiProvider.fetchLogin();
    super.initState();
  }

  @override
  void dispose() {
    etNpp.dispose();
    etPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold_state,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.webp"),
            fit: BoxFit.cover,
          ),
         /// color: Color(0xFFFD540B),
          //     gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          //   Colors.orange[900],
          //   Colors.orange[800],
          //   Colors.orange[400]
          // ])
        ),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: "airbnb",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Selamat Datang Kembali",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "airbnb"),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                       )),
                child: SingleChildScrollView(
                  child:  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[100]))),
                                      child: TextFormField(
                                        controller: etNpp,
                                        keyboardType: TextInputType.number,
                                        onChanged: (String user) {
                                          ApiProvider.npp = user;
                                        },
                                        decoration: InputDecoration(
                                            errorText:
                                            _validate ? "Masukan NPP anda" : null,
                                            border: InputBorder.none,
                                            hintText: "Masukan NPP",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400],fontFamily: 'AirBnB'),
                                            icon: const Padding(
                                                padding: const EdgeInsets.only(top: 3.0),
                                                child: const Icon(Icons.person))),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: etPassword,
                                        onChanged: (String password) {
                                          ApiProvider.password = password;
                                        },
                                        decoration: InputDecoration(

                                            errorText: _validate
                                                ? "Masukan password anda"
                                                : null,
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400],fontFamily: 'AirBnB'),
                                            border: InputBorder.none,

                                            hintText: "Password",
                                            icon: const Padding(
                                                padding: const EdgeInsets.only(top: 3.0),
                                                child: const Icon(Icons.lock))),
                                        validator: (val) => val.length < 6 ? 'Password too short.' : null,
                                        onSaved: (val) => _password = val,
                                        obscureText: _obscureText,
                                      ),

                                    ),
                                    new FlatButton(
                                        onPressed: _toggle,
                                        child: new Text(_obscureText ? "Lihat password" : "Sebunyikan password" , style: TextStyle(fontFamily: 'AirBnB'),))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 30),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.redtelkomsel),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          setState(() {
                                            etNpp.text.isEmpty
                                                ? _validate = true
                                                : _validate = false;
                                            etPassword.text.isEmpty
                                                ? _validate = true
                                                : _validate = false;
                                            if (etNpp.text.isNotEmpty &&
                                                etPassword.text.isNotEmpty) {
                                              ShowDialogLogin();
                                            }
                                          });
                                          ///ShowDialogLogin();
                                          // Navigator.of(context).pushReplacement(new MaterialPageRoute(
                                          //     builder: (BuildContext context) => RoleSelected()));
                                        });
                                      },
                                      child: Text(
                                        "Masuk",
                                        style: TextStyle(
                                            fontFamily: 'AirBnB',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    // child: Text(
                                    //   "Masuk",
                                    //   style: TextStyle(
                                    //       fontFamily: 'AirBnB',
                                    //       color: Colors.white,
                                    //       fontWeight: FontWeight.bold,
                                    //       fontSize: 20),
                                    // ),
                                  )),

                              SizedBox(height: 50,),

                              Container(
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      "Ubah perangkat ?",
                                      style: TextStyle(
                                          fontFamily: 'AirBnB',
                                          color: Colors.black87,
                                          fontSize: 19),
                                    ),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }


  void ShowDialogLogin() async {
    showDialog(
        context: context,
        barrierDismissible: false,

        child: new Dialog(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 60),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: new CircularProgressIndicator(),
                ),
                new Text("     Loading..."),
              ],
            ),
          ),
        ));

        await ApiProvider.fetchLogin();
    new Future.delayed(new Duration(seconds: 1), () async {
      Navigator.of(context, rootNavigator: true).pop();
      await scaffold_state.currentState.showSnackBar(SnackBar(
        content: Text(
          ApiProvider.message,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'AirBnB'),
        ),
        duration: Duration(seconds: 2),
      ));
      if (ApiProvider.success == 1){
        /* Navigator.of(context).pushReplacement(new MaterialPageRoute(
            builder: (BuildContext context) => SelectedRole()));*/
        Navigator.of(context).pushReplacement(new MaterialPageRoute(
            builder: (BuildContext context) => RoleSelected()));
      }else{
        print(ApiProvider.message);
      }

      /// _LoginProcess();
    });
  }
}
