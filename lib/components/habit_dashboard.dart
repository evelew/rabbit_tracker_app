import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Counter extends ChangeNotifier {
  var _markedDays = [];

  dynamic get getMarkedDays {
    return _markedDays;
  }

  void incrementCounter(selectedDay) {
    _markedDays.add(selectedDay);
    notifyListeners();
  }
}

class HabitDashboard extends StatelessWidget {
  final String name;

  const HabitDashboard({
    Key? key,
    this.name = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Counter(),
          )
        ],
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(name), SizedBox(height: 14), Calendar()]));
  }
}

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  void _incrementCounter(BuildContext context, selectedDay) {
    Provider.of<Counter>(context, listen: false).incrementCounter(selectedDay);
  }

  @override
  Widget build(BuildContext context) {
    var markedDays = Provider.of<Counter>(context).getMarkedDays;

    bool isDayMarked(day) {
      return markedDays.contains(day);
    }

    return TableCalendar(
      locale: 'pt_BR',
      firstDay: DateTime.utc(2021, 1, 11),
      lastDay: DateTime.utc(2030, 1, 11),
      focusedDay: DateTime.now(),
      headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
      onDaySelected: (selectedDay, focusedDay) {
        _incrementCounter(context, selectedDay);
      },
      calendarBuilders: CalendarBuilders(
        todayBuilder: (context, date, _) {
          return CalendarDay(
              day: date.day.toString(),
              isToday: true,
              isMarked: isDayMarked(date));
        },
        defaultBuilder: (context, date, _) {
          return CalendarDay(
              day: date.day.toString(), isMarked: isDayMarked(date));
        },
      ),
    );
  }
}

class CalendarDay extends StatelessWidget {
  final String day;
  final bool isToday;
  final bool isMarked;

  const CalendarDay({
    Key? key,
    this.day = '',
    this.isToday = false,
    this.isMarked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day.toString(),
              style: TextStyle(
                  color: isToday ? Colors.red : Colors.black,
                  fontWeight: isToday ? FontWeight.bold : FontWeight.normal),
            ),
            SizedBox(
              width: 4,
            ),
            Container(
                child: isMarked
                    ? Center(
                        child: Text(
                          '✔',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : null,
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: isToday
                        ? Border.all(color: Colors.red, width: 2)
                        : Border.all(color: Colors.black, width: 2))),
          ],
        ),
      ),
    );
  }
}
