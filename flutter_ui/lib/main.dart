import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modal/giris_kontrol.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      defaultTransition: Transition.noTransition,
      transitionDuration: Duration(seconds: 0),
      debugShowCheckedModeBanner: false,
      home: GirisKontrol(),
    );
  }
}
