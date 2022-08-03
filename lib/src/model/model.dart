import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:marvel/src/config/api_endpoints.dart';
import 'package:dio/dio.dart';


// postData ({
//   @required String? filename,
//   @required Map<String, dynamic>? data,
//   @required String? arg,
// }) async {
//   var dio = Dio();
//     final response = await dio.post(
//       APIEndpoints.url(arg),
//       data: data
//     );
//   if (response.statusCode == 200) {
//     return jsonDecode(response.toString());
//   }
//   else {
//     return null;
//   }
// }


// getDataWithHeader ({
//   @required String? filename,
//   @required Map<String, dynamic>? data,
//   @required String? arg,
// }) async {
//   var dio = Dio();
//     final response = await dio.post(
//       APIEndpoints.url(arg),
//       data: data
//     );
//   if (response.statusCode == 200) {
//     return jsonDecode(response.toString());
//   }
//   else {
//     return null;
//   }
// }


getData ({
  @required String? arg,
}) async {
  var dio = Dio();
    final response = await dio.get(
      APIEndpoints.url(arg),
    );
  if (response.statusCode == 200) {
    return jsonDecode(response.toString());
  }
  else {
    return null;
  }
}

getDataWithend ({
  @required String? arg,
}) async {
  var dio = Dio();
    final response = await dio.get(
      APIEndpoints.end(arg),
    );
  if (response.statusCode == 200) {
    return jsonDecode(response.toString());
  }
  else {
    return null;
  }
}

