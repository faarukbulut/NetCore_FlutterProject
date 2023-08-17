import 'package:flutter/material.dart';
import 'package:flutter_ui/view/giris_sayfa/giris_sayfa.dart';
import 'package:flutter_ui/view/yonetim_sayfa.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../controller/kullanici_controller.dart';
import '../helpers/secure_storage.dart';

class GirisKontrol extends StatefulWidget {
  const GirisKontrol({super.key});

  @override
  State<GirisKontrol> createState() => _GirisKontrolState();
}

class _GirisKontrolState extends State<GirisKontrol> {

  final KullaniciController _kullaniciController = Get.put(KullaniciController());

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
      return const YonetimSayfa();
    }else{
      return const GirisSayfa();
    }
  }
}