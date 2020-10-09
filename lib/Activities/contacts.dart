import 'package:flutter/material.dart';
import 'package:startup_database/auth.dart';
import 'package:startup_database/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:provider/provider.dart';
import 'package:startup_database/models/brew.dart';
import 'package:startup_database/services/database.dart';
import 'package:startup_database/contact_list.dart';

class Contacts extends StatelessWidget with NavigationStates {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        body: Container(
            child: ContactList()
        ),
      ),
    );
  }
}