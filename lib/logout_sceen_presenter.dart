import 'data/user.dart';

abstract class LogoutScreenContract {
  void onLogoutSuccess(User user);
  void onLoginError(String errorTxt);
}

class LogoutScreenPresenter {
  LogoutScreenContract _view;
  LogoutScreenPresenter(this._view);

  doLogout(User user) {
    _view.onLogoutSuccess(user);
  }
}
