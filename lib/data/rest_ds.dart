import 'dart:async';
import './user.dart';
import '../utils/network_util.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final baseUrl = "http://frozen-refuge-86379.herokuapp.com/api";
  static final loginURL = baseUrl + "/users/login";
  // static final _API_KEY = "somerandomkey";

  Future<User> login(String email, String password) {
    return _netUtil.post(loginURL,
        body: {"email": email, "password": password}).then((dynamic res) {
      // print(res["error"]);
      // if (res["error"]) throw new Exception(res["error_msg"]);
      // print(res["username"]);
      return new User.map(res);
    }).catchError((Object error) {
      return error;
    });
  }
}
