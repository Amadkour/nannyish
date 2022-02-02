part of 'app_pages.dart';

abstract class Routes {
  static const login = _Paths.login;
  static const registration = _Paths.registration;
  static const forget = _Paths.forget;
}

abstract class _Paths {
  static const login = '/login';
  static const registration = '/registration';
  static const forget = '/forget';
}
