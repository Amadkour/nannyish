import 'package:get/get.dart';
import 'package:noura_app/forgot/bindings/forgot_binding.dart';
import 'package:noura_app/forgot/views/forgot_view.dart';
import 'package:noura_app/login/bindings/login_binding.dart';
import 'package:noura_app/login/views/login_view.dart';
import 'package:noura_app/registeration/bindings/registeration_binding.dart';
import 'package:noura_app/registeration/views/registeration_view.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.login;

  static final routes = [
    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.registration,
      page: () => registrationView(),
      binding: registrationBinding(),
    ),
    GetPage(
      name: _Paths.forget,
      page: () => ForgotView(),
      binding: ForgotBinding(),
    ),
  ];
}