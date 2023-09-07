import 'package:flutter/material.dart';
import 'package:flutter_ui/view/giris_ekran_view/giris_ekran_view.dart';
import 'package:flutter_ui/viewModel/kullanici_viewmodel.dart';
import 'package:get/get.dart';

class GirisEkran extends StatefulWidget {
  const GirisEkran({super.key});

  @override
  State<GirisEkran> createState() => _GirisEkranState();
}

class _GirisEkranState extends State<GirisEkran> {

  final KullaniciViewModel _kullaniciViewModel = Get.put(KullaniciViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GirisEkranView(
        formKey: _kullaniciViewModel.formKey,
        kullaniciAdiController: _kullaniciViewModel.kullaniciAdiController,
        sifreController: _kullaniciViewModel.sifreController,
        girisYap: (){_kullaniciViewModel.girisYap(context);},
      ),
    );
  }
}