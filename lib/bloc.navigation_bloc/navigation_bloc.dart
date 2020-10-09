import 'package:bloc/bloc.dart';
import 'package:startup_database/Activities/contacts.dart';
import 'package:startup_database/Activities/dashboard.dart';
import 'package:startup_database/Activities/myProfile.dart';
import 'package:startup_database/Activities/shifts.dart';

enum NavigationEvents { ShiftsClickEvent, DashboardClickEvent, ContactsClickEvent, ProfileClickEvent}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates>{
  NavigationBloc(NavigationStates initialState) : super(initialState);

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.ShiftsClickEvent :
        yield Shifts();
        break;
      case NavigationEvents.DashboardClickEvent :
        yield Dashboard();
        break;
      case NavigationEvents.ContactsClickEvent :
        yield Contacts();
        break;
      case NavigationEvents.ProfileClickEvent :
        yield Profile();
        break;
    }
   }
}