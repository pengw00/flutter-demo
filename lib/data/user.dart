class User {
  String _username;
  String _password;
  String _avatar;
  // String _token;
  User(this._username, this._password, this._avatar);

  User.map(dynamic obj) {
    this._username = obj["username"];
    this._password = obj["token"];
    this._avatar = obj["avatar"];
    // this.token = obj["token"];
  }

  String get username => _username;
  String get password => _password;
  // String get token => _token;
  String get avatar => _avatar;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;
    // map["token"] = _token;

    return map;
  }
}
