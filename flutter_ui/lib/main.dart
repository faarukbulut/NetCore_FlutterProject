import 'package:flutter/material.dart';
import 'package:flutter_ui/view/giris_kontrol.dart';
import 'package:get/get.dart';
import 'view/giris_sayfa/giris_sayfa.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GirisKontrol(),
    );
  }
}
