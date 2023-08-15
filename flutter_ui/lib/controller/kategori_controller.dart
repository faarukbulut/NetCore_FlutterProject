import 'package:flutter/material.dart';
import 'package:flutter_ui/view/kategori_sayfa/kategori_liste_sayfa.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/kategori.dart';

class KategoriController extends GetxController{
  RxList<Kategori> kategoriler = RxList<Kategori>();
  RxBool isLoading = false.obs;

  TextEditingController kategoriAd = TextEditingController();

  void islemSirasi() async{
    await kategoriListesiniAl();
    yuklemeIslemi();
  }

  yuklemeIslemi(){
    isLoading.value = true;
  }

  Future<void> kategoriListesiniAl() async {
    final response = await http.get(Uri.parse('https://localhost:7176/api/Kategori'));
    
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      kategoriler.value = responseData.map((json) => Kategori.fromJson(json)).toList();
    } else {
      throw Exception('Veri alınamadı');
    }
  }

  Future<void> kategoriEkle() async{
    final Map<String, dynamic> data = {
      'kategoriAd': kategoriAd.text,
    };

    final response = await http.post(
      Uri.parse('https://localhost:7176/api/Kategori'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      kategoriAd.text = "";
      return Get.to(() => KategoriListeSayfa());
    } else {
      throw Exception('Kategori eklenemedi');
    }
  }



}