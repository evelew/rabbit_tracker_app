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

class Today extends StatelessWidget {
  const Today({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('jsijasdij');
  }
}

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2021, 1, 11),
      lastDay: DateTime.utc(2030, 1, 11),
      focusedDay: DateTime.now(),
      calendarBuilders: CalendarBuilders(
        todayBuilder: (context, date, _) {
          print(date);
          // final string text = date
          return Center(
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(date.day.toString()),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black, width: 2)))
                ],
              ),
            ),
          );
        },
        defaultBuilder: (context, date, _) {
          return Center(
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(date.day.toString()),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black, width: 2)))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Wrap(
  //     direction: Axis.vertical,
  //     spacing: 10,
  //     children: <Widget>[
  //       Wrap(
  //         spacing: 20,
  //         children: const [
  //           Text('Dom'),
  //           Text('Seg'),
  //           Text('Ter'),
  //           Text('Qua'),
  //           Text('Qui'),
  //           Text('Sex'),
  //           Text('Sáb'),
  //         ],
  //       ),
  //       for (int weeks = 0; weeks <= 4; weeks++) WeekCalendar()
  //     ],
  //   );
  // }
}

// class WeekCalendar extends StatelessWidget {
//   const WeekCalendar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(children: <Widget>[
//       Wrap(
//         spacing: 18,
//         children: [for (int days = 0; days <= 7; days++) CalendarDay()],
//       )
//     ]);
//   }
// }

// class CalendarDay extends StatelessWidget {
//   const CalendarDay({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 20,
//         width: 20,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(4),
//             border: Border.all(color: Colors.black, width: 2)));
//   }
// }
