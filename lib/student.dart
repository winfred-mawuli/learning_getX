// import 'package:get/get.dart';

import 'package:get/get.dart';

class Student {
  // var name = "Tom".obs;
  // var age = 25.obs;

  String name;
  int age;
  Student({required this.name, required this.age});
}

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello',
        },
        'hi_IN': {
          'hello': 'qdwfjndojn',
        },
        'fr_FR': {
          'hello': 'Bonjour',
        }
      };
}
