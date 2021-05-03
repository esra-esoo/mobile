import 'package:huayati/app/locator.dart';
import 'package:huayati/app/router.gr.dart';
import 'package:huayati/consts/account_type.dart';
import 'package:huayati/models/user.dart';
import 'package:huayati/services/company_service.dart';
import 'package:huayati/services/individual_service.dart';
import 'package:huayati/services/shared_service.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/services/user_service.dart';
import 'package:stacked/stacked.dart';

class SplashScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _individualService = locator<IndividualService>();
  final _companyService = locator<CompanyService>();
  final _sharedService = locator<SharedService>();

  Future<void> initializeView() async {
    var user = await _userService.loadUser();
    var userLoggedIn = user?.role != null;

    if (userLoggedIn) {
      setBusy(true);
      await _loadUserStatus(user);
      await _getRefuseMessages();
      _navigateToStartUp();
    } else {
      _navigateToSignIn();
    }
  }

  Future _loadUserStatus(User user) async {
    try {
      var isUploaded = false;
      if (user.role == AccountType.INDIVISUAL) {
        isUploaded = await _individualService.getUploadState();
        print('individual file upload state => $isUploaded');
      } else {
        isUploaded = await _companyService.getCompanyUploadState();
        print('company file upload state => $isUploaded');
      }
      await _userService.update(
        User(
          phoneNumbaer: user.phoneNumbaer,
          sub: user.sub,
          role: user.role,
          editMode: isUploaded,
        ),
      );
    } catch (e) {
      print(e);
      await _userService.signOut();
      _navigateToSignIn();
    }
  }

  Future _getRefuseMessages() async {
    try {
      await _sharedService.getRefuseMessage();
      print('messages has been loaded ');
    } catch (e) {
      print(e);
    }
  }

  Future _navigateToSignIn() async {
    await Future.delayed(const Duration(seconds: 2));
    _navigationService.pushNamedAndRemoveUntil(
      Routes.signInView,
    );
  }

  Future _navigateToStartUp() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _navigationService.pushNamedAndRemoveUntil(
      Routes.startUpView,
    );
  }
}
