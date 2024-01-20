
class Comp {
  final String id;
  final String nama;
  final String kategori;
  final String rating;
  final String alamat;
  final String lat;
  final String lng;
  final String cp;

  static Comp? _storedComp;

  const Comp({required this.id, required this.nama, required this.kategori, required this.rating,
    required this.alamat,required this.lat,required this.lng,required this.cp});

  factory Comp.fromJson(Map<String, dynamic> data) {
    _storedComp = Comp(
      id: data['id'] ?? '',
      nama: data['nama'] ?? '',
      kategori: data['kategori'] ?? '',
      rating: data['rating'] ?? '',
      alamat: data['alamat'] ?? '',
      lat: data['lat'] ?? '',
      lng: data['lng'] ?? '',
      cp: data['cp'] ?? '',
    );
    return _storedComp!;
  }

  static Comp? getstoredComp(){
    return _storedComp;
  }

  static List<Comp> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => Comp.fromJson(json)).toList();
  }
}