import 'package:appli_lite/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class HorizontalCalendar extends StatefulWidget {
  const HorizontalCalendar({Key? key}) : super(key: key);

  @override
  State<HorizontalCalendar> createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  DateTime day = DateTime.now();

  final months = [
    'Jan',
    'Fev',
    'Mar',
    'Abr',
    'Mai',
    'Jun',
    'Jul',
    'Ago',
    'Set',
    'Out',
    'Nov',
    'Dez',
  ];

  final days = [
    'Dom',
    'Seg',
    'Ter',
    'Qua',
    'Qui',
    'Sex',
    'Sab',
  ];

  @override
  Widget build(BuildContext context) {
    int lastday = DateTime(day.year, day.month + 1, 0).day;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 1; i <= lastday; i++) tileDay(i),
          ],
        ),
      ),
    );
  }

  Padding tileDay(int i) {
    bool today;
    if (i == day.day) {
      today = true;
    } else {
      today = false;
    }

    int weekDay() {
      int? day;

      for (int j = 1;
          j < DateTime(this.day.year, this.day.month + 1, 0).day;
          j++) {
        day = DateTime(this.day.year, this.day.month, i + 1, 0).weekday;
      }
      return day!;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          color: today ? ColorsApp.instance.primary : ColorsApp.instance.purple,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                days[weekDay() - 1],
                style: TextStyle(
                  fontSize: 12,
                  color: today ? Colors.white : Colors.black54,
                ),
              ),
              Text(
                i.toString(),
                style: TextStyle(
                  fontSize: 24,
                  color: today ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                months[day.month - 1],
                style: TextStyle(
                  fontSize: 12,
                  color: today ? Colors.white : Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
