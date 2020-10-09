import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startup_database/Activities/shifts.dart';
import 'package:startup_database/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:startup_database/sidebar/sidebar.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider <NavigationBloc>(
        create: (context) => NavigationBloc(Shifts()),
          child: Stack(
            children: <Widget>[
              BlocBuilder<NavigationBloc, NavigationStates>(
                builder: (context, navigationState) {
                  return navigationState as Widget;
                },
              ),
              SideBar(),
            ],
        ) ,
      )
    );
  }
}
