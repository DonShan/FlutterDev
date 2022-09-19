import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:loginview/user_list/models/users-list-model.dart';
import 'package:loginview/utils/constants.dart';
import 'package:loginview/user_list/repo/api_status.dart';

class UserServices {
  static Future<Object> getUser() async {
    try {
      var url = Uri.parse(USERS_LIST);
      var response = await http.get(url);
      if (200 == response.statusCode) {
        return userModelFromJson(response.body);
      }
      return Failure(code: USER_INVALID_RESPONSE, response: "Invalid Response");
    } on HttpException {
      return Failure(code: No_INTERNET, response: "No Internet");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, response: "Invalid Format");
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, response: "Unknown Error");
    }
  }
}
