import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:startup_database/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:startup_database/Activities/myProfile.dart';
//import 'package:goschedule2/states/currentUser.dart';
//import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget with NavigationStates {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<EditProfile>
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
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
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
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.black,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Name", "Employee Employee"),
              buildTextField("Mobile", "123-4567-8900"),
              buildTextField("Email", "employee@gmail.com"),
              buildTextField("Position", "Cook"),
              buildTextField("Monday Availability", "9 AM to 6 PM"),
              buildTextField("Tuesday Availability", "9 AM to 6 PM"),
              buildTextField("Wednesday Availability", "9 AM to 6 PM"),
              buildTextField("Thursday Availability", "9 AM to 6 PM"),
              buildTextField("Friday Availability", "9 AM to 6 PM"),
              buildTextField("Saturday Availability", "9 AM to 6 PM"),
              buildTextField("Sunday Availability", "9 AM to 6 PM"),

              /* buildTextField("Name", _currentUser.getCurrentUser.fullName),
              buildTextField("Mobile", _currentUser.getCurrentUser.phoneNo),
              buildTextField("Email", _currentUser.getCurrentUser.email),
              buildTextField("Position", _currentUser.getCurrentUser.position),
              buildTextField("Monday Availability", _currentUser.getCurrentUser.monAvailability),
              buildTextField("Tuesday Availability", _currentUser.getCurrentUser.tueAvailability),
              buildTextField("Wednesday Availability", _currentUser.getCurrentUser.wedAvailability),
              buildTextField("Thursday Availability", _currentUser.getCurrentUser.thuAvailability),
              buildTextField("Friday Availability", _currentUser.getCurrentUser.friAvailability),
              buildTextField("Saturday Availability", _currentUser.getCurrentUser.satAvailability),
              buildTextField("Sunday Availability", _currentUser.getCurrentUser.sunAvailability), */

              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.red,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                      );
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white)),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ),
    );
  }
}
