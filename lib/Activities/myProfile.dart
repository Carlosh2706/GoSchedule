import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:startup_database/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:startup_database/Activities/editProfile.dart';
//import 'package:goschedule2/states/currentUser.dart';
//import 'package:provider/provider.dart';

class Profile extends StatefulWidget with NavigationStates {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<Profile>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //CurrentUser _currentUser = Provider.of(context, listen: false);

    return new Scaffold(
      backgroundColor: Colors.blueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditProfile()),
          );
        },
        child: Icon(Icons.edit),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Container(
            width: 120,
            height: 120,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person_rounded,
              size: 60,
            ),
          ),
          Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Employee Employee",
                //_currentUser.getCurrentUser.fullName,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Cook",
                //_currentUser.getCurrentUser.position
              )),
          Card(
            margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person_rounded,
                        size: 32,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name'),
                          Text("Employee Employee"),
                          //Text(_currentUser.getCurrentUser.fullName),
                        ],
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Icon(
                        Icons.phone_iphone_rounded,
                        size: 32,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mobile'),
                          Text("123-456-7890"),
                          //Text(_currentUser.getCurrentUser.phoneNo),
                        ],
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        size: 32,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email'),
                          Text("employee@gmail.com"),
                          //Text(_currentUser.getCurrentUser.email),
                        ],
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Icon(
                        Icons.work_rounded,
                        size: 32,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Position'),
                          Text("Cook"),
                          //Text(_currentUser.getCurrentUser.position)
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Monday',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '09:00 AM - 06:00 PM',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "9 AM to 6 PM",
                        //_currentUser.getCurrentUser.monAvailability,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tuesday',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '09:00 AM - 06:00 PM',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "9 AM to 6 PM",
                        //_currentUser.getCurrentUser.tueAvailability,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Wednesday',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '09:00 AM - 06:00 PM',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "9 AM to 6 PM",
                        //_currentUser.getCurrentUser.wedAvailability,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thursday',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '09:00 AM - 06:00 PM',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "9 AM to 6 PM",
                        //_currentUser.getCurrentUser.thuAvailability
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Friday',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '09:00 AM - 06:00 PM',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "9 AM to 6 PM",
                        //_currentUser.getCurrentUser.friAvailability
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Saturday',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '09:00 AM - 06:00 PM',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "9 AM to 6 PM",
                        //_currentUser.getCurrentUser.satAvailability
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sunday',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '09:00 AM - 06:00 PM',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "9 AM to 6 PM",
                        //_currentUser.getCurrentUser.sunAvailability
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
