import 'package:flutter/material.dart';
import 'package:startup_database/shared/loading.dart';
import 'auth.dart';
import 'shared/constants.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //Text field state
  String name = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 110.0, 0.0, 0.0),
                    child: Text(
                      'GoSchedule',
                      style: TextStyle(
                          fontSize: 60.0, fontWeight: FontWeight.bold, color: Colors.lightGreen),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:35.0, left: 20.0, right: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: textInputDecoration.copyWith(labelText: 'Username'),
                      obscureText: true,
                      validator: (val) => val.length < 6 ? 'Enter a valid name' : null,
                      onChanged: (val) {
                        setState(() {
                          name = val;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(labelText: 'Email'),
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(labelText: 'Password'),
                      obscureText: true,
                      validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                    SizedBox(height: 76.0),
                    //Register Button
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState.validate()){
                              setState(() {
                                loading = true;
                              });
                              dynamic result = await _authService.registerWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'Please supply a valid email';
                                  loading = false;
                                });
                              }
                            }
                          },
                          child: Center(
                            child: Text(
                              'REGISTER',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
            SizedBox(height: 5.0),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already Registered?",
                  style: TextStyle(
                      fontFamily: 'Montserrat'
                  ),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    widget.toggleView();
                  },
                  child: Text('Login here',
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline
                    ),
                  ),
                )
              ],
            )
          ],
        )
    );
  }
}
