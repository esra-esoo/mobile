import 'package:huayati/app/router.gr.dart';
import 'package:huayati/models/menu_item.dart';

const List<MenuItem> companyMenu = [
  MenuItem(
    title: 'رفع مستندات الشركة',
    route: Routes.companyFormView,
    // notifciation: 3,
  ),
  MenuItem(
    title: 'رفع مستندات المخول',
    // notifciation: 1,
  ),
  MenuItem(
    title: 'بيانات الشركة',
    route: Routes.companyDataView,
  ),
  MenuItem(
    title: 'بيانات الحساب',
  ),
  MenuItem(
    title: 'بيانات المخول',
  ),
];

const List<MenuItem> individualMenu = [
  MenuItem(
    title: 'رفع المستندات',
    route: Routes.individualCreateFilesView,
    // notifciation: 2,
  ),
  MenuItem(
    title: 'البيانات الشخصية',
    route: Routes.individualPersonalDataView,
  ),
  MenuItem(
    title: 'بيانات الحساب',
  ),
];
