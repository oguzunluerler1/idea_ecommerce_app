class Urun {
  final String id;
  final String isim;
  final List<dynamic> kategori;
  final String marka;
  final int stokMiktari;
  final String satici; //todo normalce seller tipinde sonra bakıcam
  final int fiyat;
  final List<dynamic> urunResimleriUrl;

  Urun(
      {required this.id,
      required this.urunResimleriUrl,
      required this.isim,
      required this.kategori,
      required this.marka,
      required this.stokMiktari,
      required this.satici,
      required this.fiyat});

  Map<String, dynamic> toMap() => {
        'id': id,
        'urunResimleriUrl': urunResimleriUrl,
        'isim': isim,
        'kategori': kategori,
        'marka': marka,
        'stokMiktari': stokMiktari,
        'satici': satici,
        'fiyat': fiyat,
      };

  factory Urun.fromMap(Map<String, dynamic> map) => Urun(
      id: map['id'],
      isim: map['isim'],
      kategori: map['kategori'],
      marka: map['marka'],
      stokMiktari: map['stokMiktari'],
      satici: map['satici'],
      fiyat: map['fiyat'],
      urunResimleriUrl: map['urunResimleriUrl']);
}
