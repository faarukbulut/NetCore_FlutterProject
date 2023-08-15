
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/widget.dart';
import '../../controller/kategori_controller.dart';
import 'kategori_liste_sayfa.dart';

class KategoriDuzenleSayfa extends StatefulWidget {
  final int kategoriID;

  const KategoriDuzenleSayfa({
    super.key,
    required this.kategoriID,
  });

  @override
  State<KategoriDuzenleSayfa> createState() => _KategoriDuzenleSayfaState();
}

class _KategoriDuzenleSayfaState extends State<KategoriDuzenleSayfa> {

  final KategoriController _kategoriController = Get.put(KategoriController());

  @override
  void initState() {
    super.initState();
    _kategoriController.kategoriAlIslemSirasi(widget.kategoriID);
  }

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
                const Text('Kategori Düzenle', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),

            const SizedBox(height:25),

            Obx(() => 
            
              _kategoriController.isLoading == false ? CircularProgressIndicator() : 

              TextField(
                controller: _kategoriController.kategoriAd,
                decoration: textFieldDecoration('Kategori Ad'),
              ), 
            
            ),

            const SizedBox(height:20),

            butonWidget(
              (){_kategoriController.kategoriDuzenle(widget.kategoriID);},
              'Kategori Düzenle',
            ),


          ],
        ),
      ),
    );
  }
}