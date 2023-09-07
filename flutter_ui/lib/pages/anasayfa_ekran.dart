import 'package:flutter/material.dart';
import 'package:flutter_ui/view/anasayfa_ekran_view/anasayfa_ekran_view.dart';
import 'package:flutter_ui/viewModel/kullanici_viewmodel.dart';
import 'package:get/get.dart';

class AnasayfaEkran extends StatefulWidget {
  const AnasayfaEkran({super.key});

  @override
  State<AnasayfaEkran> createState() => _AnasayfaEkranState();
}

class _AnasayfaEkranState extends State<AnasayfaEkran> {

  final KullaniciViewModel _kullaniciViewModel = Get.put(KullaniciViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnasayfaEkranView(adSoyad: _kullaniciViewModel.kullanici.value.adSoyad),
    );
  }
}