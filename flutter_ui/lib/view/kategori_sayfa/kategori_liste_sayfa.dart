import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../components/widget.dart';
import '../../controller/kategori_controller.dart';

class KategoriListeSayfa extends StatefulWidget {
  const KategoriListeSayfa({super.key});

  @override
  State<KategoriListeSayfa> createState() => _KategoriListeSayfaState();
}

class _KategoriListeSayfaState extends State<KategoriListeSayfa> {

  final KategoriController _kategoriController = Get.put(KategoriController());

  @override
  void initState() {
    super.initState();
    _kategoriController.islemSirasi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('Kategori Listesi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                const Spacer(),
                butonWidget(
                  (){},
                  "Kategori Ekle"
                ),
              ],
            ),
            const SizedBox(height:10),

            Obx(() => 
              _kategoriController.isLoading.value == false ? const Center(child: CircularProgressIndicator()) : 
              Expanded(
                child: DataTable(
                  columns: const[
                    DataColumn(label: Text('Kategori ID'),),
                    DataColumn(label: Text('Kategori Adı'),),
                    DataColumn(label: Text('Düzenle'),),
                    DataColumn(label: Text('Sil'),),
                  ],
                  rows: _kategoriController.kategoriler.map((kategori) {
                    return DataRow(cells: [
                      DataCell(Text(kategori.kategoriID.toString())),
                      DataCell(Text(kategori.kategoriAd)),
                      const DataCell(Text('Düzenle', style: TextStyle(color: Colors.blue))),
                      const DataCell(Text('Sil', style: TextStyle(color: Colors.red))),
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