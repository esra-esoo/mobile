import 'package:flutter/material.dart';
import 'package:huayati/app/router.gr.dart';
import 'package:huayati/consts/account_type.dart';
import 'package:huayati/models/menu_item.dart';
import 'package:huayati/models/shared_refuse_state.dart';
import 'package:huayati/models/user.dart';
import 'package:huayati/ui/views/home/widgets/grid_item.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    var sharedRefuseState = Provider.of<SharedRefuseState>(context);
    List<MenuItem> menuList = _getMenuList(user, sharedRefuseState);

    return Container(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        padding: const EdgeInsets.only(
          right: 25,
          left: 25,
          bottom: 30,
          top: 30,
        ),
        itemCount: menuList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: getValueForScreenType<int>(
            context: context,
            mobile: 2,
            tablet: 3,
          ),
          mainAxisSpacing: 30,
          crossAxisSpacing: 15,
          childAspectRatio: 3 / 4,
        ),
        itemBuilder: (context, index) => GridItem(menuItem: menuList[index]),
      ),
    );
  }

  List<MenuItem> _getMenuList(
    User user,
    SharedRefuseState sharedRefuseState,
  ) {
    List<MenuItem> menuList = [];
    if (user.customerType == AccountTypeEng.INDIVISUAL) {
      if (user.hasUploaded) {
        menuList.add(MenuItem(
          title: 'المستندات',
          route: Routes.individualUpdateFilesView,
          notifciation:
              sharedRefuseState?.indivisualRefuseState?.numberOfFiles ?? 0,
        ));
      } else {
        menuList.add(MenuItem(
          title: 'رفع المستندات',
          route: Routes.individualCreateFilesView,
        ));
      }

      menuList.addAll([
        MenuItem(
          title: 'البيانات الشخصية',
          route: Routes.individualPersonalDataView,
        ),
        MenuItem(
          title: 'بيانات الحساب',
          route: Routes.individualBankAccountsDataView,
        ),
      ]);
    } else {
      //Company Account type
      if (user.hasUploaded) {
        menuList.addAll([
          MenuItem(
            title: 'مستندات الشركة',
            notifciation:
                sharedRefuseState?.companyRefuseState?.numberOfCompanyFiles ??
                    0,
            route: Routes.companyUpdateFilesView,
          ),
          MenuItem(
            title: 'مستندات المخولين',
            notifciation: sharedRefuseState
                    ?.companyRefuseState?.numberOfRepresentativeFiles ??
                0,
            route: Routes.representativeUpdateFilesView,
          ),
        ]);
      } else {
        menuList.addAll([
          MenuItem(
            title: 'رفع مستندات الشركة',
            route: Routes.companyCreateFilesView,
          ),
        ]);
      }
      menuList.addAll([
        MenuItem(
          title: 'بيانات الشركة',
          route: Routes.companyDataView,
        ),
        MenuItem(
          title: 'بيانات الحساب',
          route: Routes.companyBankAccountsDataView,
        ),
        MenuItem(
          title: 'بيانات المخول',
          route: Routes.representativeDataView,
        ),
      ]);
    }
    return menuList;
  }
}
