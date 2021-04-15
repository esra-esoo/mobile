// import 'dart:async';
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:vatanExpo/app/locator.dart';
// import 'package:vatanExpo/consts/storage_keys.dart';
// import 'package:vatanExpo/models/errors/phone_exists_error.dart';
// import 'package:vatanExpo/models/info.dart';
// import 'package:vatanExpo/services/third_party/localization_service.dart';
// import 'package:vatanExpo/services/third_party/secure_storage_service.dart';

// class AuthInterceptor extends Interceptor {
//   final Dio _dio;
//   final _localizationService = locator<LocalizationService>();
//   final _secureStorageService = locator<SecureStorageService>();

//   AuthInterceptor(this._dio);

//   @override
//   Future onRequest(RequestOptions options) async {
//     if (options.headers.containsKey("requires-token")) {
//       //remove the auxiliary header
//       options.headers.remove("requires-token");

//       var token = await _secureStorageService.readString(StorageKeys.TOKEN);

//       options.headers.addAll({"Authorization": "Bearer " + token});

//       return options;
//     }
//   }

//   @override
//   Future onError(DioError error) async {
//     try {
//       if (error.response != null) {
//         if (error.response.statusCode == 500) {
//           return _dio
//               .reject(_localizationService.translate('request_unkown_error'));
//         } else if (error?.response?.data['code'] != null) {
//           String message = _localizationService.isArabicLang
//               ? Info.fromJson(error.response.data).messageAr
//               : _localizationService.isEnglish
//                   ? Info.fromJson(error.response.data).messageEn
//                   : Info.fromJson(error.response.data).messageTr;
//           if (error?.response?.data['code'] == 'phoneExists') {
//             return PhoneExistsError(message);
//           } else
//             return _dio.reject(message);
//         } else {
//           return _dio
//               .reject(_localizationService.translate('request_unkown_error'));
//         }
//       } else if (error.error is SocketException) {
//         return _dio
//             .reject(_localizationService.translate('connection_error_message'));
//       } else
//         return error;
//     } catch (e) {
//       return _dio
//           .reject(_localizationService.translate('request_unkown_error'));
//     }
//   }
// }
