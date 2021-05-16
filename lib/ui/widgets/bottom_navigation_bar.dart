import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final Function onTap;
  final int currentIndex;

  const AppBottomNavigationBar({
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        // border: Border.all(color: kcolorPrimaryBlue, width: 1),
        boxShadow: [
          BoxShadow(
            color: kcolorBluelight.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: kcolorPrimaryBlue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        onTap: onTap as void Function(int)?,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2_fill),
            label: 'محادثة',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_circle_fill),
            label: 'الملف الشخصي',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.flag_fill),
            label: 'إسال شكوى',
          ),
        ],
      ),
    );
  }
}
