import 'package:get/get.dart';

import '../controllers/registeration_controller.dart';

class registrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<registrationController>(
      () => registrationController(),
    );
  }
}
