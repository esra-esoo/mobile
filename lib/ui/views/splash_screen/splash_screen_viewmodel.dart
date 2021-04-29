import 'package:huayati/app/locator.dart';
import 'package:huayati/app/router.gr.dart';
import 'package:huayati/consts/account_type.dart';
import 'package:huayati/models/user.dart';
import 'package:huayati/services/company_service.dart';
import 'package:huayati/services/individual_service.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/services/user_service.dart';
import 'package:stacked/stacked.dart';

class SplashScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _individualService = locator<IndividualService>();
  final _companyService = locator<CompanyService>();

  Future<void> initializeView() async {
    var user = await _userService.loadUser();
    var userLoggedIn = user?.role != null;

    if (userLoggedIn) {
      try {
        if (user.role == AccountType.INDIVISUAL) {
          var isUploaded = await _individualService.getIndividualUploadState();
          print('individual file upload state => $isUploaded');
          await _userService.addUser(
            User(role: user.role, editMode: isUploaded),
          );
        } else {
          var isUploaded = await _companyService.getCompanyUploadState();
          print('company file upload state => $isUploaded');
          await _userService.addUser(
            User(role: user.role, editMode: isUploaded),
          );
        }
      } catch (e) {
        print(e);
        await _userService.signOut();
        _navigateToSignIn();
      }
      _navigateToStartUp();
    } else {
      _navigateToSignIn();
    }
  }

  Future _navigateToSignIn() async {
    await Future.delayed(const Duration(seconds: 2));
    _navigationService.pushNamedAndRemoveUntil(
      Routes.signInView,
    );
  }

  Future _navigateToStartUp() async {
    await Future.delayed(const Duration(seconds: 2));
    _navigationService.pushNamedAndRemoveUntil(
      Routes.startUpView,
    );
  }
}
