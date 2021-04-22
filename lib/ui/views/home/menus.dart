import 'package:huayati/app/router.gr.dart';
import 'package:huayati/models/menu_item.dart';

const List<MenuItem> companyMenu = [
  MenuItem(
    title: 'بيانات الشركة',
  ),
  MenuItem(title: 'مستندات الشركة', route: Routes.companyView, notifciation: 3),
  MenuItem(
    title: 'بيانات الحساب',
  ),
  MenuItem(
    title: 'بيانات المخول',
  ),
  MenuItem(title: 'مستندات المخول', notifciation: 1),
];

const List<MenuItem> individualMenu = [
  MenuItem(
    title: 'البيانات الشخصية',
  ),
  MenuItem(
    title: 'بيانات الحساب',
  ),
  MenuItem(title: 'المستندات', notifciation: 2),
];
