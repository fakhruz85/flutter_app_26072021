import 'dart:convert';
import 'dart:io';

import 'package:flutter_app_1/models/api_error.dart';
import 'package:flutter_app_1/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_1/models/api_response.dart';

String _baseUrl = 'amtis.opengw.net:888';
String _pathUrl = '/fakhruz/attendance/api/v1';

Future<ApiResponse> authenticateUser(String username, String password) async {
  ApiResponse _apiResponse = new ApiResponse();
  var url = Uri.http('$_baseUrl', '$_pathUrl/auth/login');

  try {
    final response = await http
        .post(url, body: {'username': username, 'password': password});

    switch (response.statusCode) {
      case 200:
        _apiResponse.Data = User.fromJson(json.decode(response.body));
        break;
      case 401:
        //_apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
      default:
        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
    }
  } on SocketException {
    _apiResponse.ApiError = ApiError(error: "Server error. Please retry");
  }
}
