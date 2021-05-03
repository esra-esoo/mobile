import 'package:huayati/app/router.gr.dart';
import 'package:huayati/models/menu_item.dart';

List<MenuItem> companyMenu = [
  MenuItem(
    title: 'رفع مستندات الشركة',
    route: Routes.companyFormView,
  ),
  MenuItem(
    title: 'رفع مستندات المخول',
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

List<MenuItem> individualMenu = [
  MenuItem(
    title: 'رفع المستندات',
    route: Routes.individualCreateFilesView,
  ),
  MenuItem(
    title: 'المستندات',
    route: Routes.individualUpdateFilesView,
  ),
  MenuItem(
    title: 'البيانات الشخصية',
    route: Routes.individualPersonalDataView,
  ),
  MenuItem(
    title: 'بيانات الحساب',
    route: Routes.individualBankAccountDataView,
  ),
];
