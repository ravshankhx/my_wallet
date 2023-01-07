import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget {
  final Function showCalendar;
  final DateTime selectedDate;
  final Function() previousMonth;  final Function() nextMonth;

  Header(this.showCalendar, this.selectedDate,this.previousMonth,this.nextMonth);

  @override
  Widget build(BuildContext context) {
    final isLastDate =selectedDate.year == DateTime.now().year &&
        selectedDate.month == DateTime.now().month;
    final isFirstDate =selectedDate.year == 2021 &&
        selectedDate.month == 1;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              showCalendar(context);
            },
            child: Text(
              DateFormat("MMMM,  y").format(selectedDate),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: isFirstDate ? Colors.grey:Colors.red),
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: previousMonth,
                  icon: Icon(
                    Icons.arrow_left,
                    size: 30,
                    color: isFirstDate ? Colors.grey:Colors.red,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "450.000",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "so'm",
                    style: TextStyle(
                      height: 0.6,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: isLastDate? Colors.grey:Colors.red),
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: nextMonth,
                  icon: Icon(
                    Icons.arrow_right,
                    size: 30,

                    color:  isLastDate ? Colors.grey:Colors.red,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
