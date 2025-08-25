import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomHorizontalCalendar extends StatelessWidget {
  final DateTime weekStartDate;

  CustomHorizontalCalendar({required this.weekStartDate});

  @override
  Widget build(BuildContext context) {
    final days = List.generate(7, (index) => weekStartDate.add(Duration(days: index)));

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days.map((date) {
          final isSelected = date.day <= 20; // Example: Highlight <= 20
          final isUpcoming = date.day == 20;

          return Column(
            children: [
              Text(DateFormat.E().format(date).toUpperCase(),
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 3),
              CircleAvatar(
                backgroundColor: isSelected&&isUpcoming ? Colors.red :isSelected?Colors.green: Colors.white,
                radius: 18,
                child: Text(
                  '${date.day}',
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (isUpcoming)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    'Upcoming',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                )
            ],
          );
        }).toList(),
      ),
    );
  }
}