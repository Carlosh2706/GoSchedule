import 'package:flutter/material.dart';
import 'package:startup_database/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

// Example holidays.
final Map<DateTime, List> _holidays = {
  DateTime(2019, 1, 1): ['New Year\'s Day'],
  DateTime(2019, 1, 6): ['Epiphany'],
  DateTime(2019, 2, 14): ['Valentine\'s Day'],
  DateTime(2019, 4, 21): ['Easter Sunday'],
  DateTime(2019, 4, 22): ['Easter Monday'],
};

class Shifts extends StatefulWidget with NavigationStates {
  Shifts({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ShiftsState createState() => _ShiftsState();
}

class _ShiftsState extends State<Shifts> with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  AnimationController _animationController;
  List _selectedEvents;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();
    // @todo: Fetch data from firebase and add them on this variable.
    _events = {
      _selectedDay.subtract(Duration(days: 27)): [
        {'title': 'Test Shift 1', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 1', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 1', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 1', 'startTime': '8:00am', 'endTime': '5:00pm'}
      ],
      _selectedDay.subtract(Duration(days: 2)): [
        {'title': 'Test Shift 2', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 2', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 2', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 2', 'startTime': '8:00am', 'endTime': '5:00pm'}
      ],
      _selectedDay.subtract(Duration(days: 16)): [
        {'title': 'Test Shift 3', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 3', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 3', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 3', 'startTime': '8:00am', 'endTime': '5:00pm'}
      ],
      _selectedDay.subtract(Duration(days: 10)): [
        {'title': 'Test Shift 4', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 4', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 4', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 4', 'startTime': '8:00am', 'endTime': '5:00pm'}
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        {'title': 'Test Shift 5', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 5', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 5', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 5', 'startTime': '8:00am', 'endTime': '5:00pm'}
      ],
      // Today
      _selectedDay: [
        {'title': 'Test Shift 6', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 6', 'startTime': '9:00am', 'endTime': '6:00pm'},
        {'title': 'Test Shift 6', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 6', 'startTime': '9:00am', 'endTime': '6:00pm'}
      ],
      _selectedDay.add(Duration(days: 3)): [
        {'title': 'Test Shift 7', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 7', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 7', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 7', 'startTime': '8:00am', 'endTime': '5:00pm'}
      ],
      _selectedDay.add(Duration(days: 7)): [
        {'title': 'Test Shift 8', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 8', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 8', 'startTime': '8:00am', 'endTime': '5:00pm'},
        {'title': 'Test Shift 8', 'startTime': '8:00am', 'endTime': '5:00pm'}
      ],
      // _selectedDay.add(Duration(days: 3)): Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
    };

    _selectedEvents = _events[_selectedDay] ?? [];

    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const SizedBox(height: 40.0),
          Text('Shifts Schedule',
            style: TextStyle(color: Colors.green[800],fontSize: 20,fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 10.0),
          _buildTableCalendar(),
          const SizedBox(height: 10.0),
          Expanded(child: _buildEventList()),
        ],
      ),
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      initialCalendarFormat: CalendarFormat.week,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
        CalendarFormat.twoWeeks: 'Two weeks',
        CalendarFormat.week: 'Week',
      },
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepOrange[400],
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle: TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.8),
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        child: ListTile(
          title: Text(
              event['title'],
              style: TextStyle(color: Colors.black, fontSize: 16)
          ),
          subtitle: Text(
              'Starting: ' + event['startTime'] + '  Ending: ' + event['endTime'],
              style: TextStyle(color: Colors.black, fontSize: 14)
          ),
          onTap: () => print('$event tapped!'),
        ),
      ))
          .toList(),
    );
  }
}