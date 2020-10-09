import 'package:flutter/material.dart';
import 'package:startup_database/bloc.navigation_bloc/navigation_bloc.dart';

class Shifts extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Shifts', style: TextStyle(
          fontWeight: FontWeight.bold,fontSize: 28),),
      ),
    );
  }
}
