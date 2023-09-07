import 'package:flutter/material.dart';
import 'package:flutter_ui/components/widget.dart';
import 'package:flutter_ui/pages/kategori_ekran/kategori_liste_ekran.dart';
import 'package:get/get.dart';

class KategoriEkleEkranView extends StatelessWidget {
  final TextEditingController kategoriAd;
  final Function kategoriEkle;

  const KategoriEkleEkranView({
    super.key,
    required this.kategoriAd,
    required this.kategoriEkle,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                GestureDetector(
                  onTap:(){Get.to(() => const KategoriListeEkran());},
                  child: const Icon(Icons.chevron_left),
                ),
                const SizedBox(width:10),
                const Text('Kategori Ekle', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),

            const SizedBox(height:25),

            TextField(
              controller: kategoriAd,
              decoration: textFieldDecoration('Kategori Ad'),
            ),
      
            const SizedBox(height:20),

            butonWidget(
              (){ kategoriEkle(); },
              'Kategori Ekle',
            ),

          ],
        ),
      ),
    );
  }
}