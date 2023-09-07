import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/kategori_ekran/kategori_duzenle_ekran.dart';
import 'package:flutter_ui/pages/kategori_ekran/kategori_ekle_ekran.dart';
import 'package:get/get.dart';

import '../../components/widget.dart';
import '../../models/kategori.dart';
import '../../pages/anasayfa_ekran.dart';

class KategoriListeEkranView extends StatelessWidget {
  final RxBool isLoading;
  final RxList<Kategori> kategoriler;
  final Function kategoriListesiniAl;
  final Function kategoriSil;

  const KategoriListeEkranView({
    super.key,
    required this.isLoading,
    required this.kategoriler,
    required this.kategoriListesiniAl,
    required this.kategoriSil,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap:(){Get.to(() => const AnasayfaEkran());},
                  child: const Icon(Icons.chevron_left),
                ),
                const Text('Kategori Listesi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                const Spacer(),
                butonWidget(
                  (){Get.to(() => const KategoriEkleEkran());},
                  "Kategori Ekle"
                ),
              ],
            ),
            const SizedBox(height:10),
    
            Obx(() =>
              isLoading.value == false ? const Center(child: CircularProgressIndicator()) : 
              Expanded(
                child: DataTable(
                  columns: const[
                    DataColumn(label: Text('Kategori ID'),),
                    DataColumn(label: Text('Kategori Adı'),),
                    DataColumn(label: Text('Düzenle'),),
                    DataColumn(label: Text('Sil'),),
                  ],
                  rows: kategoriler.map((kategori) {
                    return DataRow(cells: [
                      DataCell(Text(kategori.kategoriID.toString())),
                      DataCell(Text(kategori.kategoriAd)),
                      DataCell(GestureDetector(onTap:(){Get.to(() => KategoriDuzenleEkran(kategoriID: kategori.kategoriID) );}, child: const Text('Düzenle', style: TextStyle(color: Colors.blue)))),
                      DataCell(
                        GestureDetector(
                          onTap:() async{
                            await kategoriSil(kategori.kategoriID);
                            Get.to(() => const AnasayfaEkran());
                          },
                          child: const Text('Sil', style: TextStyle(color: Colors.red)),
                        ),
                      ),
                    ]);
                  }).toList(),
                ),
              ),
            ),
    
    
    
    
          ],
        ),
      ),
    );
  }
}