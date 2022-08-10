import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:marvel/src/config/api_endpoints.dart';
import 'package:dio/dio.dart';


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

