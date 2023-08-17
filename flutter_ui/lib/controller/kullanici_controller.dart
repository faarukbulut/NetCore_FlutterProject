// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ui/view/yonetim_sayfa.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import '../helpers/secure_storage.dart';
import '../models/kullanici.dart';

class KullaniciController extends GetxController{

  final formKey = GlobalKey<FormState>();
  final TextEditingController kullaniciAdiController = TextEditingController();
  final TextEditingController sifreController = TextEditingController();

  var kullanici = Kullanici().obs;

  Future<void> girisYap(BuildContext context) async{

    final Map<String, dynamic> data = {
      'kullaniciAdi' : kullaniciAdiController.text,
      'sifre' : sifreController.text,
    };

    final response = await http.post(
      Uri.parse('https://localhost:7176/api/Kullanici'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if(response.statusCode == 200){
      final responseBody = json.decode(response.body);
      currentUserBilgileriniAl(responseBody['token']);
      await SecureStorage().saveToken(responseBody['token']);
      Get.offAll(() => const YonetimSayfa());
    }else{
      final hataMesaj = response.body;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Giriş başarısız'),
          content: Text(hataMesaj),
        ),
      );
    }

  }

  void currentUserBilgileriniAl(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    kullanici.value.adSoyad = decodedToken['name'] as String?;
  }


}