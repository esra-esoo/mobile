import 'dart:async';

import 'package:dio/dio.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/consts/account_type.dart';
import 'package:huayati/models/company/refuse_state.dart';
import 'package:huayati/models/individual/refuse_state.dart';
import 'package:huayati/models/shared_refuse_state.dart';
import 'package:huayati/models/user.dart';
import 'package:huayati/services/api.dart';

import 'user_service.dart';

class SharedService {
  final _api = locator<Api>();
  final _userService = locator<UserService>();
  
  SharedRefuseState _sharedRefuseState = SharedRefuseState.initial();
  SharedRefuseState get sharedRefuseState => _sharedRefuseState;
  final _sharedRefuseStateController = StreamController<SharedRefuseState>();
  Stream<SharedRefuseState> get sharedRefuseStateStream =>
      _sharedRefuseStateController.stream;



  Future<User> updateAccountInfo() async {
    try {
      final response = await _api.getCallWithToken(
        url: '/api/shared/GetCurrentCustomerInfo',
      );
      if (response == null) return User.initial();

      var user = User.fromJson(response);
      _userService.addUser(user);
      return user;
    } on DioError catch (_) {
      _userService.addUser(User.initial());
      return User.initial();
    } catch (e) {
      _userService.addUser(User.initial());
      return User.initial();
    }
  }

  Future<SharedRefuseState> getRefuseState() async {
    var user = await _userService.loadUser();
    var customerType = user.customerType;

    customerType == AccountTypeEng.INDIVISUAL
        ? await _getIndivisualRefuseState()
        : await _getCompanyRefuseState();

    return _sharedRefuseState;
  }

  Future<void> _getIndivisualRefuseState() async {
    try {
      final response = await _api.getCallWithToken(
        url: '/api/Individual/GetFilesRefuseMessage',
      );
      if (response == null) return resetRefuseState();

      var indivisualRefuseState = IndivisualRefuseState.fromJson(response);
      _sharedRefuseState = SharedRefuseState(
        companyRefuseState: null,
        indivisualRefuseState: indivisualRefuseState,
      );
      _sharedRefuseStateController.add(_sharedRefuseState);
    } on DioError catch (_) {
      resetRefuseState();
    } catch (e) {
      resetRefuseState();
    }
  }

  Future<void> _getCompanyRefuseState() async {
    try {
      final response = await _api.getCallWithToken(
        url: '/api/Company/GetFilesRefuseMessage',
      );
      if (response == null) resetRefuseState();

      var companyRefuseState = CompanyRefuseState.fromJson(response);
      _sharedRefuseState = SharedRefuseState(
        companyRefuseState: companyRefuseState,
        indivisualRefuseState: null,
      );
      _sharedRefuseStateController.add(_sharedRefuseState);
    } on DioError catch (_) {
      resetRefuseState();
    } catch (e) {
      resetRefuseState();
    }
  }

  void resetRefuseState() {
    _sharedRefuseState = SharedRefuseState.initial();
    _sharedRefuseStateController.add(_sharedRefuseState);
  }

  void dispose() {
    _sharedRefuseStateController.close();
  }
}
