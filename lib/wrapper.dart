import 'package:flutter/material.dart';
import 'package:startup_database/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:startup_database/sidebar/sidebar_layout.dart';
import 'user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserX>(context);

    //return either Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return SideBarLayout();
    }
  }
}
