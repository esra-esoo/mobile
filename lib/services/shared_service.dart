import 'dart:async';

import 'package:dio/dio.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/models/refuse_message.dart';
import 'package:huayati/services/api.dart';

class SharedService {
  final _api = locator<Api>();
  final _refuseMessageController = StreamController<RefuseMessage>();

  Stream<RefuseMessage> get refuseMessageStream =>
      _refuseMessageController.stream;

  RefuseMessage _refuseMessage = RefuseMessage.initial();
  RefuseMessage get refuseMessage => _refuseMessage;

  Future<RefuseMessage> getRefuseMessage() async {
    try {
      final response = await _api.getCallWithToken(
        url: '/api/Individual/GetFilesRefuseMessage',
      );
      if (response == null) return RefuseMessage.initial();

      var refuseMessage = RefuseMessage.fromJson(response);
      _refuseMessageController.add(refuseMessage);
      _refuseMessage = refuseMessage;
      return refuseMessage;
    } on DioError catch (_) {
      resetMessageState();
      return RefuseMessage.initial();
    } catch (e) {
      resetMessageState();
      return RefuseMessage.initial();
    }
  }

  void resetMessageState() {
    _refuseMessageController.add(RefuseMessage.initial());
    _refuseMessage = RefuseMessage.initial();
  }

  void dispose() {
    _refuseMessageController.close();
  }
}
