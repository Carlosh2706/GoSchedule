import 'package:flutter/material.dart';
import 'package:startup_database/auth.dart';
import 'package:provider/provider.dart';
import 'package:startup_database/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:startup_database/home/settings_form.dart';
import 'package:startup_database/models/brew.dart';
import 'package:startup_database/services/database.dart';
import 'package:startup_database/contact_list.dart';

class Profile extends StatelessWidget with NavigationStates {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Profile', style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 28),),
      ),
    );
  }
}

/*
  return Container(
  child: Center(
  child: Text('Profile', style: TextStyle(
  fontWeight: FontWeight.bold,fontSize: 28),),
  ),
  ); */