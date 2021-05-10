import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huayati/app/app.locator.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/models/menu_item.dart';
import 'package:huayati/models/navigation_result.dart';
import 'package:stacked_services/stacked_services.dart'hide SnackbarService;
import 'package:huayati/services/third_party/snackbar_service.dart';

class GridItem extends StatelessWidget {
  final MenuItem menuItem;
  const GridItem({Key key, @required this.menuItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (menuItem.route == null) return;
        NavigationResult result =
            await locator<NavigationService>().navigateTo(menuItem.route);
        if (result != null) {
          NavigationResult navigationResult = result;
          await HapticFeedback.mediumImpact();
          if (navigationResult.success) {
            locator<SnackbarService>().showBottomSuccessSnackbar(
              message: navigationResult.message,
            );
          } else {
            locator<SnackbarService>().showBottomErrorSnackbar(
              message: navigationResult.message,
            );
          }
        }
      },
      child: Card(
        elevation: 4,
        shadowColor: kcolorBluelight.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
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
