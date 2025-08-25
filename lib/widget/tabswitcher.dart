import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/appcolor.dart';

class CustomTabAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> tabs = ["Dhuno Ritual", "Dhuno Daily", "Dhuno Lifestyle"];
  final RxInt selectedTabIndex;
  final Function(int) onTabClick;
  final bool isLeading;

  CustomTabAppBar({
    required this.selectedTabIndex,
    required this.onTabClick,
    this.isLeading = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading:isLeading
          ?  Padding(
        padding: const EdgeInsets.only(left: 8,top: 8,bottom: 8,right: 8), // space from appbar edges
        child: InkWell(
          borderRadius: BorderRadius.circular(10), // ripple in round shape
          onTap: () => Navigator.pop(context),
          child: Container(
            alignment: Alignment. center,
            decoration: BoxDecoration(
              color: Colors.grey.shade200, // background color under icon
              shape: BoxShape.circle, // make it round
            ),
            child: Row(
              children: [
                SizedBox(width: 13,),
                InkWell(onTap: () => Get.back(),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black, // icon color
                  ),
                ),
              ],
            ),
          ),
        ),
      ):null,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xFFE9F0DE), // Update this if using a theme constant
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      title: Obx(() {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          decoration: BoxDecoration(
            color: Color(0xFFE9F0DE),
            borderRadius: BorderRadius.circular(35),
          ),
          child: Row(
            children: List.generate(tabs.length, (index) {
              final isSelected = selectedTabIndex.value == index;
              return Expanded(
                child: InkWell(
                  onTap: () => onTabClick(index),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.redLite : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: isSelected
                          ? [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(1, 2),
                        ),
                      ]
                          : [],
                    ),
                    child: Center(
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.red.shade900,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}
