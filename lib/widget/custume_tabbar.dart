
import 'package:flutter/material.dart';

import '../utils/appcolor.dart';

class CustomTabSelector extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  CustomTabSelector({required this.selectedIndex, required this.onTabSelected});

  final List<String> tabs = ["Daily", "Weekly", "Custom Date"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color:AppColors.redDark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(tabs.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.orange : Colors.transparent,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Text(
                tabs[index],
                style: TextStyle(
                  color:  Colors.white ,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
