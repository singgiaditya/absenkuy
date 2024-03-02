class NilaiPelajaran{
  final String namaPelajaran;
  final double tugas;
  final double uts;
  final double uas;

  NilaiPelajaran({required this.namaPelajaran,required this.tugas, required this.uts, required this.uas});
}

class NilaiSemester{
  final int Semester;
  final double rataRata;

  NilaiSemester({required this.Semester, required this.rataRata});
}