import 'package:flutter/material.dart';
import 'package:flutter_ui/view/kategori_ekran_view/kategori_liste_ekran_view.dart';
import 'package:flutter_ui/viewModel/kategori_viewmodel.dart';
import 'package:get/get.dart';

class KategoriListeEkran extends StatefulWidget {
  const KategoriListeEkran({super.key});

  @override
  State<KategoriListeEkran> createState() => _KategoriListeEkranState();
}

class _KategoriListeEkranState extends State<KategoriListeEkran> {

  final KategoriViewModel _kategoriViewModel = Get.put(KategoriViewModel());

  @override
  void initState() {
    super.initState();
    _kategoriViewModel.kategoriListeAlIslemSirasi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KategoriListeEkranView(
        isLoading: _kategoriViewModel.isLoading,
        kategoriler: _kategoriViewModel.kategoriler,
        kategoriListesiniAl: (){_kategoriViewModel.kategoriListeAlIslemSirasi();},
        kategoriSil: (int id){_kategoriViewModel.kategoriSil(id);},
      ),
    );
  }
}