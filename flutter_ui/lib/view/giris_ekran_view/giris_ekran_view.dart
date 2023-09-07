import 'package:flutter/material.dart';

import '../../components/widget.dart';

class GirisEkranView extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController kullaniciAdiController;
  final TextEditingController sifreController;
  final Function girisYap;

  const GirisEkranView({
    super.key,
    required this.formKey,
    required this.kullaniciAdiController,
    required this.sifreController,
    required this.girisYap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: formKey,
          child: Column(
            children: [
        
              const Text('Giriş Yap', style: TextStyle(fontSize:24, fontWeight: FontWeight.w500)),

              const SizedBox(height:24),

              TextFormField(
                validator: (val){
                  if(val!.isEmpty){
                    return 'Kullanıcı adı boş bırakılamaz';
                  }
                },
                controller: kullaniciAdiController,
                decoration: textFieldDecoration('Kullanıcı Adı'),
              ),

              const SizedBox(height:18),
        
              TextFormField(
                validator: (val){
                  if(val!.isEmpty){
                    return 'Şifre boş bırakılamaz';
                  }
                },
                controller: sifreController,
                decoration: textFieldDecoration('Şifre'),
              ),

              const SizedBox(height:18),
        
              butonWidget(
                (){ 
                  if(formKey.currentState!.validate()){
                    girisYap(); 
                  }
                },
                'Giriş Yap',
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}