import 'package:flutter/material.dart';
import 'package:flutter_ui/view/kategori_ekran_view/kategori_duzenle_ekran_view.dart';
import 'package:flutter_ui/viewModel/kategori_viewmodel.dart';
import 'package:get/get.dart';

class KategoriDuzenleEkran extends StatefulWidget {
  final int kategoriID;

  const KategoriDuzenleEkran({
    super.key,
    required this.kategoriID,
  });

  @override
  State<KategoriDuzenleEkran> createState() => _KategoriDuzenleEkranState();
}

class _KategoriDuzenleEkranState extends State<KategoriDuzenleEkran> {

  final KategoriViewModel _kategoriViewModel = Get.put(KategoriViewModel());

  @override
  void initState() {
    super.initState();
    _kategoriViewModel.kategoriAlIslemSirasi(widget.kategoriID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KategoriDuzenleEkranView(
        isLoading: _kategoriViewModel.isLoading,
        kategoriAd: _kategoriViewModel.kategoriAd,
        kategoriID: widget.kategoriID,
        kategoriDuzenle: (int id){_kategoriViewModel.kategoriDuzenle(id);},
      ),
    );
  }
}