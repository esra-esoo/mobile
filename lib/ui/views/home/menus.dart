import 'package:huayati/app/router.gr.dart';
import 'package:huayati/models/menu_item.dart';

const List<MenuItem> companyMenu = [
  MenuItem(
    title: 'بيانات الشركة',
    route: Routes.companyDataView,
  ),
  MenuItem(
    title: 'مستندات الشركة',
    route: Routes.companyFormView,
    // notifciation: 3,
  ),
  MenuItem(
    title: 'بيانات الحساب',
  ),
  MenuItem(
    title: 'بيانات المخول',
  ),
  MenuItem(
    title: 'مستندات المخول',
    // notifciation: 1,
  ),
];

const List<MenuItem> individualMenu = [
  MenuItem(
    title: 'البيانات الشخصية',
  ),
  MenuItem(
    title: 'بيانات الحساب',
  ),
  MenuItem(
    title: 'رفع المستندات',
    route: Routes.individualCreateFilesView,
    // notifciation: 2,
  ),
];
