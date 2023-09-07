import 'package:flutter/material.dart';
import 'package:flutter_ui/view/kategori_ekran_view/kategori_ekle_ekran_view.dart';
import 'package:flutter_ui/viewModel/kategori_viewmodel.dart';
import 'package:get/get.dart';

class KategoriEkleEkran extends StatefulWidget {
  const KategoriEkleEkran({super.key});

  @override
  State<KategoriEkleEkran> createState() => _KategoriEkleEkranState();
}

class _KategoriEkleEkranState extends State<KategoriEkleEkran> {

  final KategoriViewModel _kategoriViewModel = Get.put(KategoriViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KategoriEkleEkranView(
        kategoriAd: _kategoriViewModel.kategoriAd,
        kategoriEkle: (){ _kategoriViewModel.kategoriEkle(); },
      ),
    );
  }
}