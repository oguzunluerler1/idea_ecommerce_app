
class Product {
  final String isim;
  final List<dynamic> kategori;
  final String marka;
  final int stokMiktari;
  final String satici;//!normalce seller tipinde sonra bakıcam
  final int fiyat;

  //! Resim olayını eklemem lazım nasıl yapıcam bakıcam.

  Product(
      {required this.isim,
      required this.kategori,
      required this.marka,
      required this.stokMiktari,
      required this.satici,
      required this.fiyat});

  factory Product.fromMap(Map map) => Product(
      isim: map['isim'],
      kategori: map['kategori'],
      marka: map['marka'],
      stokMiktari: map['stokMiktari'],
      satici: map['satici'],
      fiyat: map['fiyat']);
}
