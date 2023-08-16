import 'package:flutter/material.dart';
import 'package:flutter_ui/view/kategori_sayfa/kategori_liste_sayfa.dart';
import 'package:get/get.dart';
import '../components/widget.dart';
import '../controller/kullanici_controller.dart';

class YonetimSayfa extends StatefulWidget {
  const YonetimSayfa({super.key});

  @override
  State<YonetimSayfa> createState() => _YonetimSayfaState();
}

class _YonetimSayfaState extends State<YonetimSayfa> {

  final KullaniciController _kullaniciController = Get.put(KullaniciController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Obx(() => Text('Hoşgeldin ${_kullaniciController.kullanici.value.adSoyad}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),),
              const SizedBox(height:20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  butonWidget(
                    (){Get.to(() => KategoriListeSayfa());},
                    "Kategori Yönetimi"
                  ),
                ],
              ),
        
            ],
          ),
        ),
      ),
    );
  }


}