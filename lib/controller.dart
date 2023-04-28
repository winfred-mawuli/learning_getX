import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:learning_getx/student.dart';

class StudentController extends GetxController {
  // var student = Student();

  final student = Student(name: 'Mawuli', age: 25).obs;
  void convertToUpperCase() {
    //   student.name.value = student.name.value.toUpperCase();

    student.update((student) {
      student?.name = student.name.toString().toUpperCase();
    });
  }
}

class MyController extends GetxController {
  var count = 0.obs;
  void increment() async {
    // await Future<int>.delayed(const Duration(seconds: 5));
    count++;
    print(count);
    update();
  }

  void changeLanguage(var params1, var params2) {
    var locale = Locale(params1, params2);
    Get.updateLocale(locale);
  }

  void cleanUpTask() {
    print('count cleaned up');
  }

  @override
  void onInit() {
    print('onInit called');
    // ever(count, (callback) => print(count));

    debounce(count, (callback) => print('count hbashubiusah'));

    super.onInit();
  }

  @override
  void onClose() {
    print('object');
    super.onClose();
  }
}
