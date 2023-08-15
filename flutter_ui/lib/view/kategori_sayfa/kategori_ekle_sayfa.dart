import 'package:flutter/material.dart';
import 'package:flutter_ui/controller/kategori_controller.dart';
import 'package:flutter_ui/view/kategori_sayfa/kategori_liste_sayfa.dart';
import 'package:get/get.dart';

import '../../components/widget.dart';

class KategoriEkleSayfa extends StatefulWidget {
  const KategoriEkleSayfa({super.key});

  @override
  State<KategoriEkleSayfa> createState() => _KategoriEkleSayfaState();
}

class _KategoriEkleSayfaState extends State<KategoriEkleSayfa> {

  final KategoriController _kategoriController = Get.put(KategoriController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap:(){Get.to(() => KategoriListeSayfa());},
                  child: const Icon(Icons.chevron_left),
                ),
                const SizedBox(width:10),
                const Text('Kategori Ekle', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
      
            const SizedBox(height:25),

            TextField(
              controller: _kategoriController.kategoriAd,
              decoration: textFieldDecoration('Kategori Ad'),
            ),
      
            const SizedBox(height:20),

            butonWidget(
              (){_kategoriController.kategoriEkle();},
              'Kategori Ekle',
            ),
      
          ],
        ),
      ),
    );
  }
}