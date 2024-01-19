
class Akun {
  final String id;
  final String nama;
  final String email;
  final String password;
  final String alamat;
  final String hp;

  static Akun? _storedAkun;

  const Akun({required this.id, required this.nama, required this.email,
    required this.password,required this.alamat,required this.hp});

  factory Akun.fromJson(Map<String, dynamic> data) {
    _storedAkun = Akun(
      id: data['id'] ?? '',
      nama: data['nama'] ?? '',
      email: data['email'] ?? '',
      password: data['password'] ?? '',
      alamat: data['alamat'] ?? '',
      hp: data['hp'] ?? '',
    );
    return _storedAkun!;
  }

   static Akun? getstoredAkun(){
     return _storedAkun;
  }
}