abstract class LogoutScreenContract {
  void onLogoutSuccess(String user);
  void onLoginError(String errorTxt);
}

class LogoutScreenPresenter {
  LogoutScreenContract _view;
  LogoutScreenPresenter(this._view);

  doLogout(String user) {
    _view.onLogoutSuccess(user);
  }
}
