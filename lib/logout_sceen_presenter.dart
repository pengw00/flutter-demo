import 'data/user.dart';

abstract class LoginScreenContract {
  void onLogoutSuccess(User user);
  void onLoginError(String errorTxt);
}

class LogoutScreenPresenter {
  LoginScreenContract _view;
  LogoutScreenPresenter(this._view);

  doLogout(User user) {
    _view.onLogoutSuccess(user);
  }
}
