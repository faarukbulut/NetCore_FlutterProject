import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ui/helpers/constants.dart';
import 'package:flutter_ui/helpers/secure_storage.dart';
import 'package:flutter_ui/models/kullanici.dart';
import 'package:flutter_ui/pages/anasayfa_ekran.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;


class KullaniciViewModel extends GetxController{
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
      Uri.parse('$apiBaseUrl/Kullanici'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if(response.statusCode >= 200 && response.statusCode < 300){
      final responseBody = json.decode(response.body);
      currentUserBilgileriniAl(responseBody['token']);
      await SecureStorage().saveToken(responseBody['token']);
      Get.offAll(() => const AnasayfaEkran());
    }else{
      final hataMesaj = response.body;
      if(context.mounted){
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Giriş başarısız'),
            content: Text(hataMesaj),
          ),
        );
      }
    }

  }

  void currentUserBilgileriniAl(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    kullanici.value.adSoyad = decodedToken['name'] as String?;
  }
  
}