import 'package:flutter/material.dart';
import 'package:flutter_ui/view/yonetim_sayfa.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: YonetimSayfa(),
    );
  }
}
