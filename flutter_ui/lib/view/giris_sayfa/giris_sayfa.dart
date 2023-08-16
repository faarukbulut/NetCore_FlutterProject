import 'package:flutter/material.dart';
import 'package:flutter_ui/components/widget.dart';
import 'package:get/get.dart';

import '../../controller/kullanici_controller.dart';

class GirisSayfa extends StatefulWidget {
  const GirisSayfa({super.key});

  @override
  State<GirisSayfa> createState() => _GirisSayfaState();
}

class _GirisSayfaState extends State<GirisSayfa> {

  final KullaniciController _kullaniciController = Get.put(KullaniciController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _kullaniciController.formKey,
            child: Column(
              children: [
          
                const Text('Giriş Yap', style: TextStyle(fontSize:24, fontWeight: FontWeight.w500)),

                const SizedBox(height:24),

                TextFormField(
                  controller: _kullaniciController.kullaniciAdiController,
                  decoration: textFieldDecoration('Kullanıcı Adı'),
                ),

                const SizedBox(height:18),
          
                TextFormField(
                  controller: _kullaniciController.sifreController,
                  decoration: textFieldDecoration('Şifre'),
                ),

                const SizedBox(height:18),
          
                butonWidget(
                  (){ _kullaniciController.girisYap(context); },
                  'Giriş Yap',
                ),
          
              ],
            ),
          ),
        ),
      )
    );
  }
}