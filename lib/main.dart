// // import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:learning_getx/common_module/app_color.dart';
// import 'package:learning_getx/common_module/app_string.dart';
// import 'package:learning_getx/views/product_list_view.dart';
// // import 'package:learning_getx/controller.dart';
// // import 'package:learning_getx/controllers/all_controller_binding.dart';
// // import 'package:learning_getx/home.dart';
// // import 'package:learning_getx/services/service.dart';
// // import 'package:learning_getx/student.dart';

// Future<void> main() async {
//   runApp(const MyApp());
// }

// // Future<void> initService() async {
// //   print('starting service...');
// //   await Get.putAsync(() async => await Service());
// //   print('All service started...');
// // }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       smartManagement: SmartManagement.full,
//       title: AppString.fetchApiData,
//       theme: ThemeData(
//         primarySwatch: AppColor.purpleColor,
//       ),
//       home: ProductView(),
//     );
//   }
// }

// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({super.key, required this.title});

// //   final String title;

// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   // StudentController controller = Get.put(StudentController());
// //   // MyController addController = Get.put(MyController());

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             // Text(
// //             //   'hello'.tr,
// //             //   style: const TextStyle(fontSize: 25, color: Colors.purple),
// //             // ),
// //             TextButton(
// //               onPressed: () {
// //                 Get.find<MyController>().increment();
// //                 // StudentController.incrementCounter();
// //               },
// //               child: const Text('click'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController emailEditingController = TextEditingController();
  final GetStorage storage = GetStorage();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetStorage and Email Validation',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GetStorage and Email Validation'),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: emailEditingController,
                  )),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: () {
                    if (GetUtils.isEmail(emailEditingController.text)) {
                      storage.write('email', emailEditingController.text);
                      Get.snackbar(
                        'success',
                        'Email saved successfully',
                        colorText: Colors.white,
                        backgroundColor: Colors.green[400],
                        snackPosition: SnackPosition.TOP,
                      );
                    } else {
                      Get.snackbar(
                        'Incorrect Email',
                        'Provide a valid Email',
                        colorText: Colors.white,
                        backgroundColor: Colors.red,
                        snackPosition: SnackPosition.TOP,
                      );
                    }
                  },
                  child: const Text('Write'),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextButton(
                  onPressed: () {
                    print('The email is ${storage.read('email')}');
                  },
                  child: Text('Read')),
            ],
          ),
        ),
      ),
    );
  }
}
