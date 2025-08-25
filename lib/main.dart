
import 'package:ecommercedata/route/approute.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Future<void> main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Data Update',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoute.splash,
      debugShowCheckedModeBanner: false,
      getPages: AppRoute.screens,
    );
  }
}

