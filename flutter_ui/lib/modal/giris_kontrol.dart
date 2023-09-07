import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/anasayfa_ekran.dart';
import 'package:flutter_ui/viewModel/kullanici_viewmodel.dart';
import 'package:get/get.dart';
import '../helpers/secure_storage.dart';
import '../pages/giris_ekran.dart';

class GirisKontrol extends StatefulWidget {
  const GirisKontrol({super.key});

  @override
  State<GirisKontrol> createState() => _GirisKontrolState();
}

class _GirisKontrolState extends State<GirisKontrol> {

  final KullaniciViewModel _kullaniciController = Get.put(KullaniciViewModel());

  String? token;
  bool isLoading = false;

  @override
  void initState(){
    super.initState();
    islemSirasi();
  }

  islemSirasi() async{
    await tokenKontrol();
    yuklemeIslemi();
  }

  tokenKontrol() async{
    token = await SecureStorage().getToken();

    // current user bilgilerini al
    if (token != null) {
      _kullaniciController.currentUserBilgileriniAl(token!);
    }
  }

  yuklemeIslemi(){
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isLoading == false){
      return const Scaffold(body: Center(child: CircularProgressIndicator())); // Splash olarak kullanılabilir.
    }
    else if(token != null){
      return const AnasayfaEkran();
    }else{
      return const GirisEkran();
    }
  }
}