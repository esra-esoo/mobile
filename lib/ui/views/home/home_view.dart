import 'package:flutter/material.dart';
import 'package:huayati/consts/account_type.dart';
import 'package:huayati/models/menu_item.dart';
import 'package:huayati/models/shared_refuse_state.dart';
import 'package:huayati/models/user.dart';
import 'package:huayati/ui/views/home/menu.dart';
import 'package:huayati/ui/views/home/widgets/grid_item.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String customerType = Provider.of<User>(context).customerType;
    SharedRefuseState sharedRefuseState =
        Provider.of<SharedRefuseState>(context);
    List<MenuItem> menuList = [];
    if (customerType == AccountTypeEng.INDIVISUAL) {
      menuList = individualMenu;
      int numberOfIndivisualRefusedFiles =
          sharedRefuseState?.indivisualRefuseState?.numberOfFiles ?? 0;
      if (numberOfIndivisualRefusedFiles > 0) {
        menuList[1].notifciation = numberOfIndivisualRefusedFiles;
      }
    } else {
      menuList = companyMenu;
      int numberOfCompanyRefusedFiles =
          sharedRefuseState?.companyRefuseState?.numberOfCompanyFiles ?? 0;
      int numberOfRepresentativeRefusedFiles =
          sharedRefuseState?.companyRefuseState?.numberOfRepresentativeFiles ??
              0;
      if (numberOfCompanyRefusedFiles > 0) {
        //TODO add notification to compnay docs form
      }
      if (numberOfRepresentativeRefusedFiles > 0) {
        //TODO add notification to Representative docs form
      }
    }

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
}
