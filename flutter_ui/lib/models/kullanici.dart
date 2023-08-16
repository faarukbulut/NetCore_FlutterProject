class Kullanici{
  final int? kullaniciID;
  final String? kullaniciAdi;
  final String? sifre;
  final String? adSoyad;

  Kullanici({
    this.kullaniciID,
    this.kullaniciAdi,
    this.sifre,
    this.adSoyad,
  });


  factory Kullanici.fromJson(Map<String, dynamic> json){
    return Kullanici(
      kullaniciID: json['kullaniciID'] as int? ?? 0,
      kullaniciAdi: json['kullaniciAdi'] as String? ?? '',
      sifre: json['sifre'] as String? ?? '',
      adSoyad: json['adSoyad'] as String? ?? '',
    );
  }

}