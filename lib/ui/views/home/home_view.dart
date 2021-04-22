import 'package:flutter/material.dart';
import 'package:huayati/ui/views/home/menus.dart';
import 'package:huayati/ui/views/home/widgets/grid_item.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        padding: const EdgeInsets.only(
          right: 25,
          left: 25,
          bottom: 30,
          top: 30,
        ),
        itemCount: companyMenu.length,
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
        itemBuilder: (context, index) => GridItem(menuItem: companyMenu[index]),
      ),
    );
  }
}
