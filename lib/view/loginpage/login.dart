import 'package:bms_mobile/view/rolepage/roleselected.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Initially password is obscure
  bool _obscureText = true;
  String _password;
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
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
                    "Welcome Back",
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
                                        decoration: InputDecoration(
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
                                        decoration: InputDecoration(
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
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(0xFFFD540B)),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          ShowDialogLogin();
                                          Navigator.of(context).pushReplacement(new MaterialPageRoute(
                                              builder: (BuildContext context) => RoleSelected()));
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
        // ignore: deprecated_member_use

        // Navigator.of(context).pushReplacement(new MaterialPageRoute(
        //     builder: (BuildContext context) => selectRoles()));
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
  }
}
