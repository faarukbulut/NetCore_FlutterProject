class Kullanici{
  String? adSoyad;

  Kullanici({
    this.adSoyad,
  });

  factory Kullanici.fromJson(Map<String, dynamic> json){
    return Kullanici(
      adSoyad: json['adSoyad'] as String? ?? '',
    );
  }

}