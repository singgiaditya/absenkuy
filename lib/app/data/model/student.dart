class Student{
  String? nama;
  String? nis;
  String? telepon;
  String? email = "";
  String? image;

  Student({this.nama, this.nis, this.telepon, this.email, this.image});

  Student.fromJson(Map<String, dynamic> json){
    nama = json['name'];
    nis = json['mapel'];
    telepon = json['telephone'];
    email = json['email'];
    image = json['image'];
  }
  
}