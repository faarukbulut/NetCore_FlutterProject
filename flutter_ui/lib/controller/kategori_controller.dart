import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/kategori.dart';

class KategoriController extends GetxController{
  RxList<Kategori> kategoriler = RxList<Kategori>();
  RxBool isLoading = false.obs;

  void islemSirasi() async{
    await kategoriListesiniAl();
    yuklemeIslemi();
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

  yuklemeIslemi(){
    isLoading.value = true;
  }

}