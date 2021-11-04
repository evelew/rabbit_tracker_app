import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitDashboard extends StatelessWidget {
  final String name;

  const HabitDashboard({
    Key? key,
    this.name = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(name), SizedBox(height: 14), Calendar()]);
  }
}

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'pt_BR',
      firstDay: DateTime.utc(2021, 1, 11),
      lastDay: DateTime.utc(2030, 1, 11),
      focusedDay: DateTime.now(),
      headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
      calendarBuilders: CalendarBuilders(
        todayBuilder: (context, date, _) {
          return CalendarDay(
            day: date.day.toString(),
            isToday: true,
          );
        },
        defaultBuilder: (context, date, _) {
          return CalendarDay(day: date.day.toString());
        },
      ),
    );
  }
}

class CalendarDay extends StatelessWidget {
  final String day;
  final bool isToday;

  const CalendarDay({
    Key? key,
    this.day = '',
    this.isToday = false,
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
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: isToday
                        ? Border.all(color: Colors.red, width: 2)
                        : Border.all(color: Colors.black, width: 2)))
          ],
        ),
      ),
    );
  }
}
