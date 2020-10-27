import 'dart:async';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:startup_database/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:startup_database/sidebar/menu_item.dart';

import '../auth.dart';

class SideBar extends StatefulWidget {

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {

  AnimationController _animationController;
  StreamController<bool> isSidebarOpenStreamController;
  Stream<bool> isSideBarOpenStream;
  StreamSink<bool> isSideBarOpenSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenStreamController = PublishSubject<bool>();
    isSideBarOpenStream = isSidebarOpenStreamController.stream;
    isSideBarOpenSink = isSidebarOpenStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenStreamController.close();
    isSideBarOpenSink.close();
    super.dispose();
  }

  void onIconPressed(){
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSideBarOpenSink.add(false);
      _animationController.reverse();
    } else {
      isSideBarOpenSink.add(true);
     _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final AuthService _auth = AuthService();

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSideBarOpenStream,
      builder: (context,isSideBarOpenAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: -100,
          left: isSideBarOpenAsync.data ? 0 : -screenWidth,
          right:isSideBarOpenAsync.data ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Material(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    color:  Colors.green[800],
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                            height: 100),
                        ListTile(
                              title: Text('name',
                                style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w800),
                              ),
                              subtitle: Text(
                                'email',
                                style: TextStyle(color: Colors.white, fontSize: 20)
                              ),
                              leading: CircleAvatar(
                                child: Icon(
                                  Icons.perm_identity,
                                  color: Colors.white,
                                ),
                                radius: 40,
                              ),
                            ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color:  Colors.white.withOpacity(0.3),
                          indent: 32,
                          endIndent: 32,
                        ),
                        MenuItem(
                          icon: EvaIcons.calendar,
                          title:'Shifts',
                          onTap: (){
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.ShiftsClickEvent);
                          }
                        ),
                        MenuItem(
                            icon: EvaIcons.clipboard,
                            title:'Dashboard',
                            onTap: (){
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.DashboardClickEvent);
                            }

                        ),
                        MenuItem(
                            icon: EvaIcons.people,
                            title:'Contacts',
                            onTap: (){
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.ContactsClickEvent);
                            }
                        ),
                        MenuItem(
                            icon: EvaIcons.person,
                            title:'My Profile',
                            onTap: (){
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.ProfileClickEvent);
                            }
                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color:  Colors.white.withOpacity(0.3),
                          indent: 32,
                          endIndent: 32,
                        ),
                        MenuItem(
                            icon: EvaIcons.settings,
                            title:'Settings'
                        ),
                        MenuItem(
                            icon: EvaIcons.logOut,
                            title:'Logout',
                            onTap: () async {
                            await _auth.signOut();
                          },
                        ),
                      ],
                    )
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -1),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Colors.green[800],
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0,0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width-1,height/2-20 ,width , height/2);
    path.quadraticBezierTo(width+1,height/2+20 ,10 , height-16);
    path.quadraticBezierTo(0,height-8 ,0 , height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip (CustomClipper<Path> oldClipper) {
    return true;
  }
}