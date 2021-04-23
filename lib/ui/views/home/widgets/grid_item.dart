import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/models/menu_item.dart';
import 'package:huayati/services/third_party/navigation_service.dart';

class GridItem extends StatelessWidget {
  final MenuItem menuItem;
  const GridItem({Key key, @required this.menuItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (menuItem.route != null)
          locator<NavigationService>().navigateTo(menuItem.route);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kcolorPrimaryBlue, width: 0.5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: kcolorPrimaryBlue.withOpacity(0.2),
              offset: Offset(0, 0),
              blurRadius: 1,
              spreadRadius: 2,
            )
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: GridTile(
          child: Center(
            child: Text(
              menuItem.title,
              style: TextStyle(
                color: kcolorPrimaryBlue,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              softWrap: true,
              maxLines: 2,
            ),
          ),
          header: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Badge(
                position: BadgePosition.topStart(),
                showBadge: menuItem.notifciation > 0,
                badgeColor: Colors.red,
                padding: const EdgeInsets.all(8),
                elevation: 0,
                badgeContent: Text(
                  menuItem.notifciation?.toString() ?? '',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              const SizedBox(width: 7),
            ],
          ),
        ),
      ),
    );
  }
}
