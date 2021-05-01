import 'package:flutter/material.dart';
import 'package:huayati/consts/account_type.dart';
import 'package:huayati/models/menu_item.dart';
import 'package:huayati/models/user.dart';
import 'package:huayati/ui/views/home/menu.dart';
import 'package:huayati/ui/views/home/widgets/grid_item.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userRole = Provider.of<User>(context).role;
    List<MenuItem> menu =
        userRole == AccountType.INDIVISUAL ? individualMenu : companyMenu;
    return Container(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        padding: const EdgeInsets.only(
          right: 25,
          left: 25,
          bottom: 30,
          top: 30,
        ),
        itemCount: menu.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: getValueForScreenType<int>(
            context: context,
            mobile: 2,
            tablet: 3,
          ),
          mainAxisSpacing: 30,
          crossAxisSpacing: 15,
          childAspectRatio: 5 / 4,
        ),
        itemBuilder: (context, index) => GridItem(menuItem: menu[index]),
      ),
    );
  }
}
