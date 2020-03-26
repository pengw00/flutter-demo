import 'dart:async';
import './user.dart';
import '../utils/network_util.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final baseUrl = "http://frozen-refuge-86379.herokuapp.com/api";
  static final loginURL = baseUrl + "user/login";
  // static final _API_KEY = "somerandomkey";

  Future<User> login(String username, String password) {
    return _netUtil.post(loginURL, body: {
      // "token": _API_KEY,
      "username": username,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      if (res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res["user"]);
    });
  }
}
