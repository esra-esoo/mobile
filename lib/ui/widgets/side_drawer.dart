import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/app/router.gr.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/services/shared_service.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/services/user_service.dart';
import 'package:huayati/ui/views/profile/profile_viewmodel.dart';
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
          children: [
            const _TopContainer(),
            Expanded(
              child: ListView(
                children: <Widget>[
                  const _ChangeProfile(),
                  const _ChangePassword(),
                  const _HelpButton(),
                ],
              ),
            ),
            const SizedBox(height: 25),
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
            Icons.help_outline_rounded,
            color: kColorText,
          ),
          title: Text(
            'مساعدة',
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(
              color: kColorText,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class _ChangePassword extends StatelessWidget {
  const _ChangePassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () => locator<NavigationService>().navigateTo(
          Routes.changePasswordView,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          leading: const Icon(
            Icons.swap_vert_circle_outlined,
            color: kColorText,
          ),
          title: Text(
            'تغيير كلمة المرور',
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(
              color: kColorText,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class _ChangeProfile extends StatelessWidget {
  const _ChangeProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () async {
          var updatedProfile = await locator<NavigationService>().navigateTo(
            Routes.editProfileView,
          );
          if (updatedProfile != null) {
            locator<ProfileViewModel>().profileInfo = updatedProfile;
            locator<ProfileViewModel>().notifyListeners();
          }
        },
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          leading: const Icon(
            CupertinoIcons.person_circle,
            color: kColorText,
          ),
          title: Text(
            'تعديل الملف الشخصي',
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(
              color: kColorText,
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
          await locator<UserService>().clearUser();
          locator<SharedService>().resetRefuseState();
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
