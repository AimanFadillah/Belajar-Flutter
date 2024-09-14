// class Catatan {
//   final int? id;
//   final String nama;
//   final String isi;
//
//   Catatan({
//     this.id,
//     required this.nama,
//     required this.isi
//   });
//
//   Map<String,Object?> toMap (){
//     return {
//       "id":id,
//       "nama":nama,
//       "isi":isi,
//     };
//   }
//
//   @override
//   String toString (){
//     return "catan{id:$id,nama:$nama,isi:$isi}";
//   }
// }

class Catatan {
  int? id;
  String? nama;
  String? isi;

  Catatan({this.id, this.nama, this.isi});

  Catatan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    isi = json['isi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['isi'] = this.isi;
    return data;
  }
}