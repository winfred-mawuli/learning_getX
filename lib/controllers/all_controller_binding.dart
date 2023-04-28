import 'package:get/get.dart';
import 'package:learning_getx/controller.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyController>(() => MyController());
    Get.lazyPut<StudentController>(() => StudentController());
  }
}
