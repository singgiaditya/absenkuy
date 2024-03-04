class Guru{
  String? nama;
  String? mapel;
  String? telepon;
  String? image;

  Guru({this.nama, this.mapel, this.telepon,this.image});

  Guru.fromJson(Map<String, dynamic> json){
    nama = json['name'];
    mapel = json['mapel'];
    telepon = json['telephone'];
    image = json['image'];
  }
  
}