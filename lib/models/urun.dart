class Urun {
  final String isim;
  final List<dynamic> kategori;
  final String marka;
  final int stokMiktari;
  final String satici; //todo normalce seller tipinde sonra bakıcam
  final int fiyat;
  final double puanOrt;
  //todo Resim olayını eklemem lazım nasıl yapıcam bakıcam.

  Urun(
      {required this.isim,
      required this.kategori,
      required this.marka,
      required this.stokMiktari,
      required this.satici,
      required this.fiyat,
      this.puanOrt = 0});
      //TODO: puan ortalaması şu an direkt olarak default değer alıyor. ona göre bunu yapacaksak daha sonra required yapıp tüm programdaki fonksiyonlara onun da atanması lazım.

  factory Urun.fromMap(Map map) => Urun(
      isim: map['isim'],
      kategori: map['kategori'],
      marka: map['marka'],
      stokMiktari: map['stokMiktari'],
      satici: map['satici'],
      fiyat: map['fiyat'],
      puanOrt: map['puanOrt']);
}
