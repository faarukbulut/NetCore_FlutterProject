class Kategori {
  final int kategoriID;
  final String kategoriAd;

  Kategori({required this.kategoriID, required this.kategoriAd});

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return Kategori(
      kategoriID: json['kategoriID'] as int? ?? 0,
      kategoriAd: json['kategoriAd'] as String? ?? '',
    );
  }
}
