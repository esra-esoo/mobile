// import 'package:dio/dio.dart';
// import 'package:dio_http_cache/dio_http_cache.dart';
// import 'package:flutter/material.dart';
// import 'package:vatanExpo/interceptors/app_interceptor.dart';
// import 'package:vatanExpo/interceptors/auth_interceptor.dart';

// class Api {
//   final endpoint;
//   static DioCacheManager _dioCacheManager;

//   final Dio _dioAuth = Dio();
//   final Dio _dio = Dio();
//   final Dio _dioCached = Dio();

//   Api(this.endpoint) {
//     // interceptor that handle errors and requests
//     _dioAuth.interceptors.add(AuthInterceptor(_dioAuth));
//     _dio.interceptors.add(AppInterceptor(_dio));
//     _dioCached.interceptors.add(AppInterceptor(_dioCached));
//   }

//   DioCacheManager getCacheManager() {
//     if (null == _dioCacheManager) {
//       _dioCacheManager = DioCacheManager(CacheConfig(baseUrl: endpoint));
//     }
//     return _dioCacheManager;
//   }

//   Future postApiCall({@required String url, @required dynamic data}) async {
//     try {
//       final response = await _dio.post(
//         endpoint + url,
//         data: data,
//       );
//       return response.data;
//     } catch (e) {
//       throw e;
//     }
//   }

//   Future postAuthCall({@required String url, @required dynamic data}) async {
//     try {
//       final response = await _dioAuth.post(
//         endpoint + url,
//         data: data,
//       );
//       return response.data;
//     } catch (e) {
//       throw e;
//     }
//   }

//   Future getApiCall(
//       {@required String url, Map<String, dynamic> queryParameters}) async {
//     try {
//       final response = await _dio.get(
//         endpoint + url,
//         queryParameters: queryParameters,
//       );
//       return response.data;
//     } catch (e) {
//       throw e;
//     }
//   }

//   // Future cachedGetApiCall({
//   //   @required String url,
//   //   @required Map<String, dynamic> queryParameters,
//   // }) async {
//   //   try {
//   //     _dioCached.interceptors.clear();
//   //     _dioCached.interceptors.add(AppInterceptor(_dioCached));
//   //     _dioCached.interceptors.add(getCacheManager().interceptor);

//   //     final response = await _dioCached.get(
//   //       endpoint + url,
//   //       queryParameters: queryParameters,
//   //       options: buildCacheOptions(
//   //         const Duration(days: 3),
//   //         forceRefresh: true,
//   //       ),
//   //     );
//   //     return response.data;
//   //   } catch (e) {
//   //     throw e;
//   //   }
//   // }

//   Future postApiCallWithToken({@required String url, @required data}) async {
//     try {
//       final response = await _dio.post(
//         endpoint + url,
//         data: data,
//         options: Options(headers: {"requires-token": true}),
//       );
//       return response.data;
//     } catch (e) {
//       throw e;
//     }
//   }

//   Future getApiCallWithToken(
//       {@required String url, Map<String, dynamic> queryParameters}) async {
//     try {
//       final response = await _dio.get(
//         endpoint + url,
//         queryParameters: queryParameters,
//         options: Options(headers: {"requires-token": true}),
//       );
//       return response.data;
//     } catch (e) {
//       throw e;
//     }
//   }

//   Future putApiCall({
//     @required String url,
//     @required dynamic data,
//   }) async {
//     try {
//       final response = await _dio.put(
//         endpoint + url,
//         data: data,
//       );
//       return response.data;
//     } catch (e) {
//       throw e;
//     }
//   }

//   Future putApiCallWithToken({
//     @required String url,
//     @required dynamic data,
//   }) async {
//     try {
//       final response = await _dio.put(
//         endpoint + url,
//         data: data,
//         options: Options(headers: {"requires-token": true}),
//       );
//       return response.data;
//     } catch (e) {
//       throw e;
//     }
//   }

//   Future deleteApiCallWithToken({
//     @required String url,
//   }) async {
//     try {
//       final response = await _dio.delete(
//         endpoint + url,
//         options: Options(headers: {"requires-token": true}),
//       );
//       return response.data;
//     } catch (e) {
//       throw e;
//     }
//   }
// }
