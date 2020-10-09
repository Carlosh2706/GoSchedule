import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:startup_database/auth.dart';
import 'package:startup_database/wrapper.dart';
import 'package:provider/provider.dart';
import 'user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return StreamProvider<UserX>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
