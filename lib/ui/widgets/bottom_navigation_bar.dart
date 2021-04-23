import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final Function onTap;
  final int currentIndex;

  const AppBottomNavigationBar({
    @required this.onTap,
    @required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        // border: Border.all(color: kcolorPrimaryBlue, width: 1),
         boxShadow: [
          BoxShadow(
            color: kcolorPrimaryBlue.withOpacity(0.6),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        selectedItemColor: kcolorPrimaryBlue,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        onTap: onTap,
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
