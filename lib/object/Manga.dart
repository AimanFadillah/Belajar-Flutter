class Manga {
  String? gambar;
  String? judul;
  String? score;
  String? slug;

  Manga({this.gambar, this.judul, this.score, this.slug});

  Manga.fromJson(Map<String, dynamic> json) {
    gambar = json['gambar'];
    judul = json['judul'];
    score = json['score'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gambar'] = this.gambar;
    data['judul'] = this.judul;
    data['score'] = this.score;
    data['slug'] = this.slug;
    return data;
  }
}