import 'package:flutter/material.dart';
import 'package:flutter_ui/helpers/constants.dart';
import 'package:flutter_ui/view/giris_sayfa/giris_sayfa.dart';
import 'package:flutter_ui/view/kategori_sayfa/kategori_liste_sayfa.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../helpers/secure_storage.dart';
import '../models/kategori.dart';

class KategoriController extends GetxController{
  RxList<Kategori> kategoriler = RxList<Kategori>();
  RxList<Kategori> kategori = RxList<Kategori>();
  RxBool isLoading = false.obs;

  TextEditingController kategoriAd = TextEditingController();

  void kategoriListeAlIslemSirasi() async{
    await kategoriListesiniAl();
    yuklemeIslemi();
  }

  yuklemeIslemi(){
    isLoading.value = true;
  }

  Future<void> kategoriListesiniAl() async {
    var token = await SecureStorage().getToken();

    final response = await http.get(
      Uri.parse('${apiBaseUrl}/Kategori'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final List<dynamic> responseData = json.decode(response.body);
      kategoriler.value = responseData.map((json) => Kategori.fromJson(json)).toList();
    } else {
      Get.offAll(() => const GirisSayfa());
    }
  }

  Future<void> kategoriEkle() async{
    var token = await SecureStorage().getToken();

    final Map<String, dynamic> data = {
      'kategoriAd': kategoriAd.text,
    };

    final response = await http.post(
      Uri.parse('${apiBaseUrl}/Kategori'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      kategoriAd.text = "";
      return Get.to(() => const KategoriListeSayfa());
    } else {
      Get.offAll(() => const GirisSayfa());
    }
  }

  void kategoriAlIslemSirasi(int id) async{
    await kategoriAl(id);
    kategoriAd.text = kategori[0].kategoriAd;
    yuklemeIslemi();
  }

  Future<void> kategoriAl(int id) async{
    var token = await SecureStorage().getToken();

    final response = await http.get(
      Uri.parse('${apiBaseUrl}/Kategori/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if(response.statusCode >= 200 && response.statusCode < 300){
      final Map<String, dynamic> responseData = json.decode(response.body);
      kategori.assignAll([Kategori.fromJson(responseData)]);
    }else{
      Get.offAll(() => const GirisSayfa());
    }
  }

  Future<void> kategoriDuzenle(int id) async{

    var token = await SecureStorage().getToken();

    final Map<String, dynamic> data = {
      'kategoriAd': kategoriAd.text,
    };

    final response = await http.put(
      Uri.parse('${apiBaseUrl}/Kategori/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      kategoriAd.text = "";
      return Get.to(() => const KategoriListeSayfa());
    } else {
      Get.offAll(() => const GirisSayfa());
    }

  }


  Future<void> kategoriSil(int id) async{

    var token = await SecureStorage().getToken();

    final response = await http.delete(
      Uri.parse('${apiBaseUrl}/Kategori/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if(response.statusCode < 200 || response.statusCode >= 300) {
      Get.offAll(() => const GirisSayfa());
    }
  }


}