import 'package:get/get.dart';

class ControllerRegistry {
  factory ControllerRegistry() {
    return _controllerRegistry;
  }

  ControllerRegistry._internal();

  static final ControllerRegistry _controllerRegistry =
      ControllerRegistry._internal();

  static final List<void Function()> _disposeFunctions = [];

  static T registerController<T extends GetxController>(T controller) {
    _disposeFunctions.add(() => Get.delete<T>());

    return Get.put(controller);
  }

  static void disposeAll() {
    for (final disposeFunction in _disposeFunctions) {
      disposeFunction();
    }
    _disposeFunctions.clear();
  }
}
