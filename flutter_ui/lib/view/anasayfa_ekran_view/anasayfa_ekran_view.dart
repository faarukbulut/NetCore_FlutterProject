import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/giris_ekran.dart';
import 'package:flutter_ui/pages/kategori_ekran/kategori_liste_ekran.dart';
import 'package:get/get.dart';
import '../../components/widget.dart';
import '../../helpers/secure_storage.dart';

class AnasayfaEkranView extends StatelessWidget {
  final String? adSoyad;
  const AnasayfaEkranView({super.key, required this.adSoyad});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text('Hoşgeldin $adSoyad', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                const Spacer(),
                butonWidget(() async{
                  SecureStorage().deleteToken();
                  Get.offAll(() => const GirisEkran());
                }, 'Çıkış Yap'),
              ],
            ),

            const SizedBox(height:20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                butonWidget(
                  (){Get.to(() => const KategoriListeEkran());},
                  "Kategori Yönetimi"
                ),
              ],
            ),
      
          ],
        ),
      ),
    );
  }
}