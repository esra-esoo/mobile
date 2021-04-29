import 'package:flutter/material.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/app/router.gr.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/services/third_party/secure_storage_service.dart';
import 'package:huayati/services/user_service.dart';
import 'package:huayati/ui/widgets/botton_padding.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .75,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const _TopContainer(),
            const SizedBox(height: 25),
            const _HelpButton(),
            const Spacer(),
            const _SignOutButton(),
            const BottomPadding(),
          ],
        ),
      ),
    );
  }
}

class _TopContainer extends StatelessWidget {
  const _TopContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kcolorPrimaryBlue,
      child: SafeArea(
        top: true,
        minimum: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              splashColor: Colors.white,
              icon: Icon(
                Icons.close,
                color: Colors.white,
                size: 33,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}

class _HelpButton extends StatelessWidget {
  const _HelpButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {},
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          leading: const Icon(
            Icons.help,
            color: kcolorPrimaryBlue,
          ),
          title: Text(
            'مساعدة',
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class _SignOutButton extends StatelessWidget {
  const _SignOutButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () async {
          await locator<SecureStorageService>().deleteAll();
          await locator<UserService>().removeUser();
          await locator<NavigationService>()
              .pushNamedAndRemoveUntil(Routes.signInView);
        },
        splashColor: Colors.red,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          leading: const Icon(
            Icons.exit_to_app,
            color: Colors.red,
          ),
          title: Text(
            'تسجيل خروج',
            softWrap: false,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
