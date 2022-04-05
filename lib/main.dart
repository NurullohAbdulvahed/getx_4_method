import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_4_method/pages/create_page.dart';

import 'pages/home_page.dart';
import 'services/di_service.dart';

Future main() async{
  await DIService.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      getPages: [
        GetPage(name: "/HomePage", page: () => const HomePage()),
        GetPage(name: "/CreatePage", page: () => const CreatePage())
      ],
    );
  }
}

